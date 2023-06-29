//
//  InfoShippingTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class InfoShippingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imagePhone: UIImageView!
    @IBOutlet weak var labelNamePhone: UILabel!
    @IBOutlet weak var labelCodeOder: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    func configCell(model: DataInfoShipping) {
        imagePhone.image = UIImage(named: model.image)
        labelNamePhone.text = model.name
        labelCodeOder.text = model.codeOrder
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
}
