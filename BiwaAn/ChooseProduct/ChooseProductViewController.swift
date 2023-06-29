//
//  ChooseProductViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit

class ChooseProductViewController: UIViewController {
    var imageLogo : String = ""
    var textPhone: String = ""
    @IBOutlet weak var btnNext: UIButton!
    
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var lableNamePhone: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoImage.image = UIImage(named: imageLogo)
        lableNamePhone.text = textPhone
        btnNext.layer.cornerRadius = 30
        btnNext.layer.maskedCorners = [.layerMinXMinYCorner]
    }

    @IBAction func actionbtnCart(_ sender: Any) {
    }
    @IBAction func actionbtnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func actionbtnNext(_ sender: Any) {
        let vc = ChooseViewController()
        vc.modalPresentationStyle = .overFullScreen
        vc.delegate = self
        self.present(vc, animated: true)
    }
}
extension ChooseProductViewController: ChooseProtocol {
    func navigateEditor() {
        self.dismiss(animated: true)
        self.navigationController?.pushViewController(EditorPhoneViewController(nibName: "EditorPhoneViewController", bundle: nil), animated: true)
    }
    
    func navigateSelected() {
        self.dismiss(animated: true)
        self.navigationController?.pushViewController(SelectedTemplateViewController(nibName: "SelectedTemplateViewController", bundle: nil), animated: true)
    }
}
