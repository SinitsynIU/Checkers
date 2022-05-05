//
//  AboutViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 01.03.2022.
//

import UIKit

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var backButton: ButtonCustom!
    @IBOutlet weak var infoGameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        setupUI()
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
        view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
    }
    
    private func setupLocalization() {
        aboutLabel.text = "aboutLabel_text_aboutVC".localized
        infoGameLabel.text = "infoGameLabel_text_aboutVC".localized
        backButton.text = "backButton_text_setVC".localized
    }
    
    @IBAction func BackButtonAction(_ sender: Any) {
        if let vc = UIStoryboard(name: "PlayerViewController", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
