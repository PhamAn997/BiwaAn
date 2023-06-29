//
//  SettingBiwaViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class SettingBiwaViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    @IBAction func nextToCart(_ sender: Any) {
        self.navigationController?.pushViewController(CartViewController(nibName: "CartViewController", bundle: nil), animated: true)
    }
    
    @IBAction func nextToOffer(_ sender: Any) {
        self.navigationController?.pushViewController(NewFileViewController(nibName: "NewFileViewController", bundle: nil), animated: true)
    }
    
    @IBAction func nextToAddress(_ sender: Any) {
        self.navigationController?.pushViewController(AddressViewController(nibName: "AddressViewController", bundle: nil), animated: true)
    }
    
    @IBAction func nextToInfoAddress(_ sender: Any) {
        self.navigationController?.pushViewController(InfoShippingViewController(nibName: "InfoShippingViewController", bundle: nil), animated: true)
    }
    
    @IBAction func nextToHistory(_ sender: Any) {
    }
    
    @IBAction func nextToWebsite(_ sender: Any) {
    }
    
    @IBAction func nextToContact(_ sender: Any) {
    }
    
    @IBAction func nextToPrivacy(_ sender: Any) {
    }
    
    @IBAction func nextToDeleteAccount(_ sender: Any) {
        self.navigationController?.pushViewController(DeleteAccViewController(nibName: "DeleteAccViewController", bundle: nil), animated: true)
    }
    
    @IBAction func nextToChangePass(_ sender: Any) {
        self.navigationController?.pushViewController(ChangePassViewController(nibName: "ChangePassViewController", bundle: nil), animated: true)
    }
    
    @IBAction func actionLogOut(_ sender: Any) {
        self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
    }
}
