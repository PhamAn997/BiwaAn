//
//  TypePhoneCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class TypePhoneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(model: dataTypePhone) {
        labelName.text = model.name
    }
}
