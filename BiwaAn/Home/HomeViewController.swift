//
//  HomeViewController.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    var template : [DataTemplate] = [DataTemplate(image: "imagecollec"),
                                     DataTemplate(image: "imagecollec"),
                                     DataTemplate(image: "imagecollec"),
                                     DataTemplate(image: "imagecollec")]
    var selected : [DataHomeReponse] = []
    var typePhone: [ProductVariant] = []
    
    @IBOutlet weak var templateCollectionView: UICollectionView!
    @IBOutlet weak var selectPhoneCollectionView: UICollectionView!
    @IBOutlet weak var typePhoneCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        templateCollectionView.dataSource = self
        templateCollectionView.delegate = self
        templateCollectionView.register(cellType: TemplateCollectionViewCell.self)
        templateCollectionView.showsHorizontalScrollIndicator = false

        selectPhoneCollectionView.dataSource = self
        selectPhoneCollectionView.delegate = self
        selectPhoneCollectionView.register(cellType: SelectCollectionViewCell.self)
        selectPhoneCollectionView.showsHorizontalScrollIndicator = false
        
        typePhoneCollectionView.dataSource = self
        typePhoneCollectionView.delegate = self
        typePhoneCollectionView.register(cellType: TypePhoneCollectionViewCell.self)
        typePhoneCollectionView.showsVerticalScrollIndicator = false
        
        BaseAPI.share.fetchData(urlString: "http://oposvn.com/api/v2/phone-device",
                                responseType: HomeReponse.self){ result in
            switch result {
            case .success(let model):
                self.selected = model.data
                
                if model.data.count > 0 {
                    self.selectedFirstPhone()
                }
                self.selectPhoneCollectionView.reloadData()
                
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func selectedFirstPhone() {
        selected[0].iSelected = true
        typePhone  = selected[0].product_variant
        selectPhoneCollectionView.reloadData()
        typePhoneCollectionView.reloadData()
    }
    
}

extension HomeViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case templateCollectionView:
            return template.count
        case selectPhoneCollectionView:
            return selected.count
        default :
            return typePhone.count
            
            
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case templateCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCollectionViewCell", for: indexPath) as! TemplateCollectionViewCell
            cell.configCell(model: template[indexPath.row] )
            return cell
        case selectPhoneCollectionView:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectCollectionViewCell", for: indexPath) as! SelectCollectionViewCell
            cell.configCell(model: selected[indexPath.row] )
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypePhoneCollectionViewCell", for: indexPath) as! TypePhoneCollectionViewCell
            cell.configCell(model: typePhone[indexPath.row])
            return cell
        }
        
    }
    
    
}

extension HomeViewController : UICollectionViewDelegate ,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case templateCollectionView:
            let with = UIScreen.main.bounds.size.width * 250 / 375
            let height = collectionView.frame.height
            return CGSize(width: with,
                          height: height)
        case selectPhoneCollectionView:
            let width = selected[indexPath.row].name.widthOfString(usingFont: .systemFont(ofSize: 14))
            return CGSize(width: width + 40,
                          height: collectionView.frame.height)
        default:
            let width = (collectionView.frame.width - 20 ) / 2
            let height = width * 82 / 165
            return CGSize(width: width,
                          height: height)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        switch collectionView {
        case templateCollectionView:
            return 16
        case selectPhoneCollectionView:
            return 0
        default:
            return 15
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        switch collectionView {
        case selectPhoneCollectionView:
            selected.forEach { item in
                item.iSelected = false
            }
            selected[indexPath.row].iSelected = true
            typePhone = selected[indexPath.row].product_variant
            selectPhoneCollectionView.reloadData()
            typePhoneCollectionView.reloadData()
            
        case typePhoneCollectionView:
            typePhone.forEach { item in
                item.iSelected = false
            }
            typePhone[indexPath.row].iSelected = true
            typePhoneCollectionView.reloadData()
            let rootVC = ProductVariantViewController(nibName: "ProductVariantViewController", bundle: nil)
            self.navigationController?.pushViewController(rootVC, animated: true)
            
        default:
            let rootVC = ProductVariantViewController(nibName: "ProductVariantViewController", bundle: nil)
            self.navigationController?.pushViewController(rootVC, animated: true)
        }
    }
}

struct DataTemplate {
    let image : String
}
