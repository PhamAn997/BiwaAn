//
//  ProductVariantViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class ProductVariantViewController: UIViewController {
    var data: [DataVariant] = [DataVariant(image: "Rectangle1", name: "Iphone 13 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle2", name: "Iphone 11 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle3", name: "Iphone 12 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle1", name: "Iphone 14 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle2", name: "Iphone 10 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle3", name: "Iphone 12 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle1", name: "Iphone 11 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle2", name: "Iphone 13 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle3", name: "Iphone 16 Mini", genres: "GEL", money: "120 000 VND"),DataVariant(image: "Rectangle1", name: "Iphone 139 Mini", genres: "GEL", money: "120 000 VND")]
    
    @IBOutlet weak var productVariantCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productVariantCollectionView.register(cellType: ProductVariantCollectionViewCell.self)
        productVariantCollectionView.dataSource = self
        productVariantCollectionView.delegate = self
    }
    
    @IBAction func actionbtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionbtnCart(_ sender: Any) {
    }
    
}
extension ProductVariantViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductVariantCollectionViewCell", for: indexPath) as? ProductVariantCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        return cell
    }
    
    
}

extension ProductVariantViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (UIScreen.main.bounds.size.width - 34 - 5 ) / 2
        let height = width * 241 / 169
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = ChooseProductViewController(nibName: "ChooseProductViewController", bundle: nil)
        vc.textPhone = data[indexPath.row].name
        vc.imageLogo = data[indexPath.row].image
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

struct DataVariant {
    var image: String
    var name : String
    var genres: String
    var money: String
}
