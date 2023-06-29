//
//  NewFileViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class NewFileViewController: UIViewController {
    var data: [DataOffer] = [DataOffer(image: "o_Rectangle1", title: "Ngày của mẹ giảm  30% OFF", descrip: "Description of offer here"),
                             DataOffer(image: "o_Rectangle2", title: "Back to school! 50% OFF", descrip: "Description of offer here"),
                             DataOffer(image: "o_Rectangle1", title: "Lễ tình nhân ! 50% OFF", descrip: "Description of offer here"),
                             DataOffer(image: "o_Rectangle2", title: "Ngày của mẹ giảm  30% OFF", descrip: "Description of offer here"),
                             DataOffer(image: "o_Rectangle2", title: "Ngày của mẹ giảm  30% OFF", descrip: "Description of offer here"),]
    @IBOutlet weak var newOffer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        newOffer.register(cellType: NewOfferTableViewCell.self)
        newOffer.dataSource = self
        newOffer.delegate = self
    }

    @IBAction func actionbtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

extension NewFileViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewOfferTableViewCell", for: indexPath) as? NewOfferTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}
extension NewFileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height = (tableView.frame.width - 27 ) * 178 / 322
        return height
    }
    
}

extension NewFileViewController: NewOfferProtocol {
    func navigate() {
        self.navigationController?.pushViewController(DiscounViewController(nibName: "DiscounViewController", bundle: nil), animated: true)
    }
    
}

struct DataOffer {
    var image: String
    var title: String
    var descrip: String
}
