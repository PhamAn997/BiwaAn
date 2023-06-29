//
//  DiscounViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class DiscounViewController: UIViewController {
    var data: [DataDiscout] = [DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22"),
                               DataDiscout(discout: "Giảm 20K cho hóa đơn trên 300k  ", date: "02/22/22"),
                               DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22"),
                               DataDiscout(discout: "Giảm 20K cho hóa đơn trên 300k  ", date: "02/22/22"),
                               DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22"),
                               DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22"),
                               DataDiscout(discout: "Giảm 20K cho hóa đơn trên 300k  ", date: "02/22/22"),
                               DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22"),
                               DataDiscout(discout: "Miễn phí vận chuyển ", date: "02/22/22")]
    
    @IBOutlet weak var discountTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        discountTableView.register(cellType: DiscountTableViewCell.self)
        discountTableView.dataSource = self
        discountTableView.delegate = self
     
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    

}
extension DiscounViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DiscountTableViewCell", for: indexPath) as? DiscountTableViewCell else {
            return UITableViewCell()
        }
        cell.configCell(model: data[indexPath.row])
        return cell
    }
    
    
}

extension DiscounViewController : UITableViewDelegate {
    
}

struct DataDiscout{
    var discout: String
    var date: String
}
