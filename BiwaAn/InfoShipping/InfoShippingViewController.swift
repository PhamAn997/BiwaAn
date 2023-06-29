//
//  InfoShippingViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class InfoShippingViewController: UIViewController {
    var data: [DataInfoShipping] = [DataInfoShipping(image: "set_phone", name: "IPhone 12 pro max", codeOrder: "Mã đơn hàng: XKW119u3"),
                                    DataInfoShipping(image: "set_phone", name: "IPhone 12 pro max", codeOrder: "Mã đơn hàng: XKW119u3"),
                                    DataInfoShipping(image: "set_phone", name: "IPhone 12 pro max", codeOrder: "Mã đơn hàng: XKW119u3"),
                                    DataInfoShipping(image: "set_phone", name: "IPhone 12 pro max", codeOrder: "Mã đơn hàng: XKW119u3"),
                                    DataInfoShipping(image: "set_phone", name: "IPhone 12 pro max", codeOrder: "Mã đơn hàng: XKW119u3")]
    @IBOutlet weak var infoShippingTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        infoShippingTableView.register(cellType: InfoShippingTableViewCell.self)
        infoShippingTableView.dataSource = self
        infoShippingTableView.delegate = self
    }
    
    @IBAction func actionbtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
extension InfoShippingViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "InfoShippingTableViewCell", for: indexPath) as? InfoShippingTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        return cell
    }
    
    
}

extension InfoShippingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        121
    }
}

struct DataInfoShipping {
    var image: String
    var name: String
    var codeOrder: String
}
