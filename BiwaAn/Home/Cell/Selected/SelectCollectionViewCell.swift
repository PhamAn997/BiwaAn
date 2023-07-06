//
//  SelectCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 06/07/2023.
//

import UIKit

class SelectCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dash: UIView!
    @IBOutlet weak var labelName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: DataHomeReponse ) {
        labelName.text = model.name
        let iSelected = model.iSelected ?? false
        if iSelected {
            labelName.textColor = .black
            labelName.font = .boldSystemFont(ofSize: 16)
            dash.isHidden = false
        } else {
            labelName.textColor = .black.withAlphaComponent(0.4)
            labelName.font = .systemFont(ofSize: 16)
            dash.isHidden = true
        }
    }
}
