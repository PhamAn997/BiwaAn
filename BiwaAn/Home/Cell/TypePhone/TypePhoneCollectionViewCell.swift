//
//  TypePhoneCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 06/07/2023.
//

import UIKit

class TypePhoneCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(model: ProductVariant) {
        labelName.text = model.name
        let iSelected = model.iSelected ?? false
        if iSelected {
            containerView.layer.borderColor = UIColor(hexString: "#149DEB").cgColor
        }
        else {
            containerView.layer.borderColor = UIColor(hexString: "#C4C4C4").cgColor
        }
    }
}
