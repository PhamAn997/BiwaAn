//
//  TemplateCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class TemplateCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imageTitle: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(model: dataTemplate) {
        imageTitle.image = UIImage(named: model.image)
    }
    
}
