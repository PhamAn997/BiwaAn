//
//  ChooseViewController.swift
//  BiwaAn
//
//  Created by TTH on 28/06/2023.
//

import UIKit
protocol ChooseProtocol : AnyObject {
    func navigateSelected()
    func navigateEditor()
}

class ChooseViewController: UIViewController {
    weak var delegate: ChooseProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func btnDismis(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionDismis(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func actionChooseDesign(_ sender: Any) {
        self.delegate?.navigateEditor()
    }
    
    @IBAction func actionChooseMau(_ sender: Any) {
        self.delegate?.navigateSelected()
    }
    
}
