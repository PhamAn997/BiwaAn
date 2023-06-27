//
//  TypePhoneTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class TypePhoneTableViewCell: UITableViewCell {
    var data : [dataTypePhone] = [dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro Max Max của Max "),
                                  dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro "),
                                  dataTypePhone(name: "Iphone 11 Pro ")]
                                  
                                                                        
    @IBOutlet weak var typePhoneCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        typePhoneCollectionView.register(cellType: TypePhoneCollectionViewCell.self)
        typePhoneCollectionView.dataSource = self
        typePhoneCollectionView.delegate = self
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
extension TypePhoneTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypePhoneCollectionViewCell", for: indexPath) as! TypePhoneCollectionViewCell
        cell.configCell(model: data[indexPath.row])
        return cell
    }
    
    
}
extension TypePhoneTableViewCell : UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let witdh = (UIScreen.main.bounds.size.width  - 12 - 12) / 2
        let height = witdh * 82 / 165
        return CGSize(width: witdh, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
}

struct dataTypePhone {
    var name: String
}
