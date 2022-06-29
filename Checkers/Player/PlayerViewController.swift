//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 08.02.2022.
//

import UIKit
import LTMorphingLabel
import GoogleMobileAds
import NVActivityIndicatorView

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var checkersGameLabel: LTMorphingLabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var choseColorCheckerLabel: UILabel!
    @IBOutlet weak var startButton: ButtonCustom!
    @IBOutlet weak var choseColorChekersPlayer: UISegmentedControl!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var settingsButton: ButtonCustom!
    @IBOutlet weak var aboutButton: ButtonCustom!
    @IBOutlet weak var scoreButton: ButtonCustom!
    
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    private lazy var alertView: AlertView = {
        let alertView: AlertView = AlertView.loadFromNib()
        alertView.delegateLeftButton = self
        alertView.delegateRightButton = self
        return alertView
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
       let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var choseChekers: String = "white"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocalization()
        setupVisualEffectView()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            getUserSettings()
    }
    
    func setupVisualEffectView() {
        view.addSubview(visualEffectView)
        visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.alpha = 0
        visualEffectView.contentView.addSubview(activityIndicatorView)
        activityIndicatorView.alpha = 0
    }
    
    func setAlert(vsImageIsTrue: Bool) {
        view.addSubview(alertView)
        alertView.center = view.center
        if vsImageIsTrue == true {
            alertView.set(vsViewImage: true, leftButtonTitle: "OK", rightButtonTitle: "backButton_text_setVC".localized)
        } else {
            alertView.set(title: "buttonStartAlertLoad_message_playerVC".localized, body: "buttonStartAlert_message_playerVC".localized, leftButtonTitle: "buttonSaveAlertYes_message_startGameVC".localized, rightButtonTitle: "buttonSaveAlertNo_message_startGameVC".localized)
        }
    }
    
    private func setupAction () {
        alertView.secondPlayerNameTextField.addTarget(self, action: #selector(secondPlayerNameTextFieldChangeAction), for: .editingChanged)
    }
    
    @objc func secondPlayerNameTextFieldChangeAction () {
        if (alertView.secondPlayerNameTextField.text?.count ?? 0) > 0 {
            alertView.leftButton.isEnabled = true
        } else {
            alertView.leftButton.isEnabled = false
        }
    }
    
    func animateIn() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.alpha = 1
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4,
                       animations: {
                        self.visualEffectView.alpha = 0
                        self.alertView.alpha = 0
                        self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
           self.alertView.removeFromSuperview()
        }
    }
    
    private func setupLocalization() {
        checkersGameLabel.text = "gameCheckers_text_startGameVC".localized
        choseColorCheckerLabel.text = "choseColorCheckerLabel_text_settingsVC".localized
        startButton.text = "startButton_text_settingsVC".localized
        scoreButton.text = "scoreLabel_text_startGameVC".localized
        settingsButton.text = "settingsLabel_text_setVC".localized
        aboutButton.text = "aboutLabel_text_aboutVC".localized
        choseColorChekersPlayer.setTitle("choseColorChekersPlayerWhite_Title_settingsVC".localized, forSegmentAt: 0)
        choseColorChekersPlayer.setTitle("choseColorChekersPlayerGray_Title_settingsVC".localized, forSegmentAt: 1)
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        playerImageView.layer.cornerRadius = 75
        checkersGameLabel.morphingCharacterDelay = 1.5
        checkersGameLabel.morphingEffect = .sparkle
        choseColorChekersPlayer.selectedSegmentIndex = 0
    }
    
    private func getUserSettings () {
        playerName.text = UserDefaultsSettings.firstPlayerName
        playerImageView.image = UserDefaultsSettings.avatar
        if UserDefaultsSettings.backgroundColor == nil {
            view.backgroundColor = .white
            choseColorChekersPlayer.backgroundColor = .white
        } else {
            view.backgroundColor = UserDefaultsSettings.backgroundColor
            choseColorChekersPlayer.backgroundColor = UserDefaultsSettings.backgroundColor
        }
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        if UserDefaultsSettings.checkerModel != nil {
            self.setAlert(vsImageIsTrue: false)
            self.animateIn()
        } else {
            self.setAlert(vsImageIsTrue: true)
            self.animateIn()
            
        }
    }
    
    @IBAction func buttonScore(_ sender: Any) {
        guard let vc = ScoreViewController.getInstanceViewController as? ScoreViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func choseColorChekersPleyer(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            choseChekers = "white"
            sender.selectedSegmentTintColor = .white
        } else {
            choseChekers = "gray"
            sender.selectedSegmentTintColor = .gray
        }
    }
    
    @IBAction func buttonSettings(_ sender: Any) {
        guard let vc = SettingsViewController.getInstanceViewController as? SettingsViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.alpha = 1
            self.activityIndicatorView.alpha = 1
        }
        activityIndicatorView.startAnimating()
        AdsManager.shared.setupRewarded(viewController: self) { [weak self] in
            self?.activityIndicatorView.stopAnimating()
        } onError: {
            print("Failed to load rewarded ad with error")
            UIView.animate(withDuration: 0.4,
                           animations: {
                            self.visualEffectView.alpha = 0
                            self.activityIndicatorView.alpha = 0
            })
            self.activityIndicatorView.stopAnimating()
            guard let vc = AboutViewController.getInstanceViewController as? AboutViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension UINavigationController {
    
  public func pushViewController(viewController: UIViewController,
                                 animated: Bool,
                                 completion: (() -> Void)?) {
    CATransaction.begin()
    CATransaction.setCompletionBlock(completion)
    pushViewController(viewController, animated: animated)
    CATransaction.commit()
  }
}

extension PlayerViewController: GADFullScreenContentDelegate {
    
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        UIView.animate(withDuration: 0.4) {
            self.visualEffectView.alpha = 1
            self.activityIndicatorView.alpha = 1
        }
        guard let vc = AboutViewController.getInstanceViewController as? AboutViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension PlayerViewController: AlertDelegateLeftButton, AlertDelegateRightButton {
    
    func leftButtonTapped() {
        animateOut()
        if UserDefaultsSettings.checkerModel != nil {
            guard let vc = StartGameViewController.getInstanceViewController as? StartGameViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        } else {
            UserDefaultsSettings.secondPlayerName = alertView.secondPlayerNameTextField.text
            UserDefaultsSettings.choseChackerPlaying = choseChekers
            guard let vc = StartGameViewController.getInstanceViewController as? StartGameViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func rightButtonTapped() {
        if UserDefaultsSettings.checkerModel != nil {
            UserDefaultsSettings.UserDefaultsRemoveGameIsFinish()
            setAlert(vsImageIsTrue: true)
            animateIn()
        } else {
            alertView.secondPlayerNameTextField.text = nil
            animateOut()
        }
    }
}
