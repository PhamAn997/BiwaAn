//
//  DeleteAccViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class DeleteAccViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func actionBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func actionDeleteAcc(_ sender: Any) {
        let arlet = UIAlertController(title: "", message: "Bạn có chắc chắn muốn xóa tài khoản?", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Đồng ý", style: .default) { (act) in
            self.dismiss(animated: true)
            self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: false)
        }
        let cancel = UIAlertAction(title: "Không", style: .default) { (act) in
            self.dismiss(animated: true)
        }
        arlet.addAction(cancel)
        arlet.addAction(ok)
        self.present(arlet, animated: true)
    }
    

}
