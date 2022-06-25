//
//  AboutViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 01.03.2022.
//

import UIKit
import GoogleMobileAds

class AboutViewController: UIViewController {
    
    @IBOutlet weak var aboutLabel: UILabel!
    @IBOutlet weak var bunnerView: GADBannerView!
    @IBOutlet weak var backButton: ButtonCustom!
    @IBOutlet weak var infoGameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLocalization()
        setupUI()
        AdsManager.shared.setupBunner(bannerView: bunnerView, viewController: self)
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        if UserDefaultsSettings.backgroundColor == nil {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = UserDefaultsSettings.backgroundColor
        }
    }
    
    private func setupLocalization() {
        aboutLabel.text = "aboutLabel_text_aboutVC".localized
        infoGameLabel.text = "infoGameLabel_text_aboutVC".localized
        backButton.text = "backButton_text_setVC".localized
    }
    
    @IBAction func BackButtonAction(_ sender: Any) {
        guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}
