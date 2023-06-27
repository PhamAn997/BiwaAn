//
//  RegisterViewController.swift
//  BiwaAn
//
//  Created by TTH on 26/06/2023.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var labelPassWord: UITextField!
    @IBOutlet weak var labelRePassWord: UITextField!
    @IBOutlet weak var labelEmail: UITextField!
    @IBOutlet weak var labelLogin: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        setuptextColor()
    }
    func setuptextColor() {
        let arrtriText = NSMutableAttributedString.getAttributedString(fromString: "Bạn đã có tài khoản？Đăng nhập")
        arrtriText.apply(color: .init(hexString: "000000", alpha: 0.8), subString: "Đăng nhập")
        labelLogin.attributedText = arrtriText
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabelProvision(tap:)))
        labelLogin.addGestureRecognizer(tap)
        labelLogin.isUserInteractionEnabled = true
    }
        @objc func tapLabelProvision(tap: UITapGestureRecognizer) {
            self.navigationController?.pushViewController(LoginViewController(nibName: "LoginViewController", bundle: nil), animated: true)
        }
    
    @IBAction func actionHidenPass(_ sender: Any) {
        if labelPassWord.isSecureTextEntry == true {
            labelPassWord.isSecureTextEntry = false
        } else {
            labelPassWord.isSecureTextEntry = true
        }
        
    }
    @IBAction func actionHidenRePass(_ sender: Any) {
        if labelRePassWord.isSecureTextEntry == true {
            labelRePassWord.isSecureTextEntry = false
        } else {
            labelRePassWord.isSecureTextEntry = true
        }
    }
    @IBAction func actionbtnRegister(_ sender: Any) {
        if labelPassWord.text == labelRePassWord.text {
            let vc = LoginViewController(nibName: "LoginViewController" , bundle: nil)
            vc.textEmail = labelEmail.text ?? ""
            vc.textPass = labelPassWord.text ?? ""
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alert = UIAlertController(title: "Mật Khẩu", message: "Hai mật khẩu phải giống nhau", preferredStyle: .alert)
            let alertActionOk = UIAlertAction(title: "OK", style: .default) { (act) in
                self.dismiss(animated: true)
            }
            alert.addAction(alertActionOk)
            self.present(alert, animated: true, completion: nil)        }
    }
    
    @IBAction func actionbtnFacebook(_ sender: Any) {
    }
    
    @IBAction func actionbtnApple(_ sender: Any) {
    }

    @IBAction func actionbtnGoogle(_ sender: Any) {
    }
    

}
