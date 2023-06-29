//
//  ProductVariantCollectionViewCell.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class ProductVariantCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelGenres: UILabel!
    @IBOutlet weak var labelMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: DataVariant) {
        imageLogo.image = UIImage(named: model.image)
        labelName.text = model.name
        labelGenres.text = model.genres
        labelMoney.text = model.money
    }
}
