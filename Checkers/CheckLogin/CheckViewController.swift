//
//  CheckViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 03.02.2022.
//

import UIKit
class CheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        playerNameChek()
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
    }
    
    private func playerNameChek() {
        if UserDefaults.standard.object(forKey: "userName") != nil {
            if let vc = UIStoryboard(name: "PlayerViewController", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
            } else {
            if let vc = UIStoryboard(name: "LoginViewController", bundle: nil).instantiateInitialViewController() as? LoginViewController {
                navigationController?.pushViewController(vc, animated: true)
            }
            }
    }
}
