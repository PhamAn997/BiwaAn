//
//  TemplateTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

protocol TemplateTableViewProtocol: AnyObject {
    func didSelected(item: dataTemplate)
}

class TemplateTableViewCell: UITableViewCell {
    var data : [dataTemplate] = [dataTemplate(image: "imagecollec"),dataTemplate(image: "imagecollec"),
                                 dataTemplate(image: "imagecollec"),dataTemplate(image: "imagecollec"),
                                 dataTemplate(image: "imagecollec"),dataTemplate(image: "lol")]
    
    @IBOutlet weak var templateCollectionView: UICollectionView!
    weak var delegate: TemplateTableViewProtocol?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        templateCollectionView.register(cellType: TemplateCollectionViewCell.self)
        templateCollectionView.dataSource = self
        templateCollectionView.delegate = self
    }

    @IBAction func actionbtnAll(_ sender: Any) {
        
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

   
    }
    
}

extension TemplateTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TemplateCollectionViewCell", for: indexPath) as? TemplateCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        return cell
    }
    
    
}

extension TemplateTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelected(item: data[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        let with =  UIScreen.main.bounds.size.width * 250 / 375
        let height = with * 111 / 245
        return CGSize(width: with, height: height)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
      15
    }
}

struct dataTemplate {
    var image: String
}
