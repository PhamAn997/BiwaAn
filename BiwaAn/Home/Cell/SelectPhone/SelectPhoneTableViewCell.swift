//
//  SelectPhoneTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class SelectPhoneTableViewCell: UITableViewCell {
    var selectedIndexPath: IndexPath?
    var data: [dataSelect] = [dataSelect(name: "Iphone", isSelected: true),
                              dataSelect(name: "SamSung"),
                              dataSelect(name: "Bphone"),
                              dataSelect(name: "Oppo"),
                              dataSelect(name: "Nokia"),
                              dataSelect(name: "Iphone")]
    @IBOutlet weak var selectPhoneCollectionView: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        selectPhoneCollectionView.register(cellType: SelectPhoneCollectionViewCell.self)
        selectPhoneCollectionView.dataSource = self
        selectPhoneCollectionView.delegate = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
extension SelectPhoneTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SelectPhoneCollectionViewCell", for: indexPath) as! SelectPhoneCollectionViewCell
        cell.configCell(model: data[indexPath.row])
        return cell
    }
}

extension SelectPhoneTableViewCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = data[indexPath.row].name.widthOfString(usingFont: .medium(size: 16))
        return CGSize(width: width + 30, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        data.forEach { item in
            item.isSelected = false
        }
        data[indexPath.row].isSelected = true
        selectPhoneCollectionView.reloadData()
        
    }
    
}
class dataSelect {
    var name: String
    var isSelected: Bool
    
    init(name: String, isSelected: Bool = false) {
        self.name = name
        self.isSelected = isSelected
    }
}

