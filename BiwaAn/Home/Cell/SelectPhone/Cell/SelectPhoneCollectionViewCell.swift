//
//  SelectPhoneCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class SelectPhoneCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var lableName: UILabel!
    
    @IBOutlet weak var dashView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell (model: dataSelect) {
        lableName.text = model.name
    }
}
