//
//  DiscountTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 29/06/2023.
//

import UIKit

class DiscountTableViewCell: UITableViewCell {

    @IBOutlet weak var labelDiscout: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func configCell(model: DataDiscout) {
        labelDiscout.text = model.discout
        labelDate.text = model.date
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func actionCopy(_ sender: Any) {
    }
    
}
