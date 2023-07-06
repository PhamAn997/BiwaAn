//
//  TemplateCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 06/07/2023.
//

import UIKit

class TemplateCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageLogo: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: DataTemplate ) {
        imageLogo.image = UIImage(named: model.image)
    }
}
