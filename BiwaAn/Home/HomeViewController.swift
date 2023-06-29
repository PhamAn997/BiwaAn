//
//  HomeViewController.swift
//  BiwaAn
//
//  Created by TTH on 27/06/2023.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var homeTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        homeTableView.register(cellType: TemplateTableViewCell.self)
        homeTableView.register(cellType: SelectPhoneTableViewCell.self)
        homeTableView.register(cellType: TypePhoneTableViewCell.self)
        homeTableView.dataSource = self
        homeTableView.delegate = self
        homeTableView.separatorStyle = .none
        
    }
    
    
}

extension HomeViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateTableViewCell",
                                                     for: indexPath) as! TemplateTableViewCell
            cell.delegate = self
            return cell
        }
        else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SelectPhoneTableViewCell",
                                                     for: indexPath) as! SelectPhoneTableViewCell
            return cell
        }
        else  {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TypePhoneTableViewCell",
                                                     for: indexPath) as! TypePhoneTableViewCell
            return cell
        }
        
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            let height = UIScreen.main.bounds.size.width * 195 / 375
            return height
        }
        else  if indexPath.section == 1  {
            return 122
        }
        else {
            let height = tableView.frame.height - 122 - UIScreen.main.bounds.size.width * 195 / 375
            
            return height
        }
    }
}

extension HomeViewController: TemplateTableViewProtocol {
    func didSelected(item: dataTemplate) {
        let vc = ProductVariantViewController(nibName: "ProductVariantViewController", bundle: nil)
        vc.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(vc , animated: true)
    }
}
