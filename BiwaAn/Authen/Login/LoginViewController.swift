//
//  LoginViewController.swift
//  BiwaAn
//
//  Created by TTH on 26/06/2023./Users/tth/Documents/A/BiwaAn/BiwaAn/BiwaAn.xcodeproj
///Users/tth/Documents/A/BiwaAn/BiwaAn/BiwaAn.xcodeproj

import UIKit

class LoginViewController: UIViewController {
    var textEmail : String = ""
    var textPass: String = "" 
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var lableRegister: UILabel!
    @IBOutlet weak var txtFieldEmail: UITextField!
    @IBOutlet weak var txtFieldPassWord: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingAttrLabel()
        txtFieldEmail.text = textEmail
        txtFieldPassWord.text = textPass
        
    
    }
    func settingAttrLabel() {
    let attrText = NSMutableAttributedString.getAttributedString(fromString: "Bạn chưa có tài khoản? Đăng kí")
        attrText.apply(color: .init(hexString: "000000", alpha: 0.8), subString: "Đăng kí")
        lableRegister.attributedText = attrText
    let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        lableRegister.addGestureRecognizer(tap)
        lableRegister.isUserInteractionEnabled = true
}
    @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
        self.navigationController?.pushViewController(RegisterViewController(nibName: "RegisterViewController", bundle: nil), animated: true)
    }
    @IBAction func actionbtnLogin(_ sender: Any) {
        self.navigationController?.pushViewController(HomeViewController(nibName: "HomeViewController", bundle: nil), animated: true)
    }
    
    @IBAction func actionbtnFogotPass(_ sender: Any) {
        self.navigationController?.pushViewController(FogotPassViewController(nibName: "FogotPassViewController", bundle: nil), animated: true)
    }
    @IBAction func actionbtnFacebook(_ sender: Any) {
    }
    @IBAction func actionbtnApple(_ sender: Any) {
    }
    @IBAction func actionbtnGoogle(_ sender: Any) {
    }
     

}
