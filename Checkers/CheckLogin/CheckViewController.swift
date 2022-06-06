//
//  CheckViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 03.02.2022.
//

import UIKit
import NVActivityIndicatorView
import GlitchLabel

class CheckViewController: UIViewController {

    @IBOutlet weak var checkerImageView: UIImageView!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    @IBOutlet weak var checkerLabel: GlitchLabel!
    
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        group.enter()
        RemoteConfigureManager.shared.connectToFirebase { [weak self] in
            guard let self = self else { return }
            self.group.leave()
        }

        group.notify(queue: .main) { [weak self] in
            guard let self = self else { return }
            self.stopAnimations()
            self.playerNameChek()
        }
    }
    
    private func stopAnimations() {
        activityIndicatorView.stopAnimating()
        UIView.animate(withDuration: 0.5){ [weak self] in
            guard let self = self else { return }
            self.checkerLabel.alpha = 0
            self.checkerImageView.alpha = 0
        }
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        activityIndicatorView.startAnimating()
    }
    
    private func playerNameChek() {
        if UserDefaults.standard.object(forKey: "userName") != nil {
            guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else {
            guard let vc = LoginViewController.getInstanceViewController as? LoginViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
