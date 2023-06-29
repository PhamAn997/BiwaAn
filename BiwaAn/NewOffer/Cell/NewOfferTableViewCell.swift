//
//  NewOfferTableViewCell.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit
protocol NewOfferProtocol : AnyObject {
    func navigate()
}

class NewOfferTableViewCell: UITableViewCell {
    weak var delegate: NewOfferProtocol?
    @IBOutlet weak var btnNext: UIButton!
    @IBOutlet weak var imageOffer: UIImageView!
    @IBOutlet weak var labelDescrip: UILabel!
    @IBOutlet weak var labelTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        btnNext.layer.cornerRadius = 30
        btnNext.layer.maskedCorners = [.layerMinXMinYCorner]
    }
    func configCell (model: DataOffer) {
        imageOffer.image = UIImage(named: model.image)
        labelTitle.text = model.title
        labelDescrip.text = model.descrip
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func actionNext(_ sender: Any) {
        self.delegate?.navigate()
    }
}
