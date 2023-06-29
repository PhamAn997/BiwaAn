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
        let homeVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        let homeNavi = UINavigationController(rootViewController: homeVC)
        homeNavi.tabBarItem = UITabBarItem(title: "Trang chủ", image: UIImage(named: "icon_home"), selectedImage: UIImage(named: "icon_home"))
        
        //Messages
        
        let cartVC = CartViewController(nibName: "CartViewController", bundle: nil)
        let cartNavi = UINavigationController(rootViewController: cartVC )
        cartVC.tabBarItem = UITabBarItem(title: "Giỏ hàng", image: UIImage(named: "icon_cart"), selectedImage: UIImage(named: "icon_cart"))
        
        let settingVC = SettingBiwaViewController(nibName: "SettingBiwaViewController", bundle: nil)
        let settingNavi = UINavigationController(rootViewController: settingVC )
        settingVC.tabBarItem = UITabBarItem(title: "Cài đặt", image: UIImage(named: "icon_setting"), selectedImage: UIImage(named: "icon_setting"))
        
        
        //tabbar controller
        let tabbarController = UITabBarController()
        tabbarController.viewControllers = [homeNavi, cartNavi, settingNavi]
        tabbarController.tabBar.tintColor = .red
        tabbarController.view.backgroundColor = .white
        
        guard let delegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate,
              let window = delegate.window else { return }
        window.rootViewController = tabbarController
        window.makeKeyAndVisible()
        
        
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
