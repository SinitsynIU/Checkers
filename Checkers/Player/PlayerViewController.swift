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
    
    @IBOutlet weak var vsContentView: UIView!
    @IBOutlet weak var vsTextFieldPlayerName: UITextField!
    @IBOutlet weak var blur: UIVisualEffectView!
    @IBOutlet weak var checkersGameLabel: LTMorphingLabel!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var choseColorCheckerLabel: UILabel!
    @IBOutlet weak var startButton: ButtonCustom!
    @IBOutlet weak var vsOkButton: UIButton!
    @IBOutlet weak var choseColorChekersPlayer: UISegmentedControl!
    @IBOutlet weak var playerName: UILabel!
    @IBOutlet weak var vsBackButton: UIButton!
    @IBOutlet weak var settingsButton: ButtonCustom!
    @IBOutlet weak var aboutButton: ButtonCustom!
    @IBOutlet weak var scoreButton: ButtonCustom!
    @IBOutlet weak var activityIndicatorView: NVActivityIndicatorView!
    
    var choseChekers: String = "white"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupLocalization()
        setupAction()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getPlayerName()
        getPlayerAvatar()
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
        blur.isHidden = true
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
        vsContentView.alpha = 0
        vsContentView.layer.cornerRadius = 30
        vsContentView.layer.borderWidth = 1
        vsTextFieldPlayerName.layer.cornerRadius = 25
        vsTextFieldPlayerName.layer.borderWidth = 1
        vsTextFieldPlayerName.layer.borderColor = UIColor.black.cgColor
        vsContentView.layer.borderColor = UIColor.black.cgColor
        vsOkButton.layer.cornerRadius = 15
        vsOkButton.layer.borderWidth = 1
        vsBackButton.layer.cornerRadius = 15
        vsBackButton.layer.borderWidth = 1
        vsOkButton.isEnabled = false
    }
    
   private func getPlayerAvatar () {
        if let dataImageAv = UserDefaults.standard.data(forKey: "avatarImageView") {
            return self.playerImageView.image = UIImage(data: dataImageAv)
        }
    }
    
    private func getPlayerName () {
        if let i = UserDefaults.standard.object(forKey: "userName") {
            let name: String = i as! String
            playerName.text = "\(name)"
        }
    }
    
    func setupAction () {
        vsTextFieldPlayerName.addTarget(self, action: #selector(textFieldNameChangeAction), for: .editingChanged)
    }
    
    @objc func textFieldNameChangeAction () {
        if (vsTextFieldPlayerName.text?.count ?? 0) > 0 {
            vsOkButton.isEnabled = true
        } else {
            vsOkButton.isEnabled = false
        }
    }
    
    @IBAction func buttonStart(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "Checkers") != nil {
            let alert = UIAlertController(title: nil, message: "buttonStartAlert_message_playerVC".localized, preferredStyle: .alert)
            let yes = UIAlertAction(title: "buttonSaveAlertYes_message_startGameVC".localized, style: .default) { _ in
                guard let vc = StartGameViewController.getInstanceViewController as? StartGameViewController else { return }
                self.navigationController?.pushViewController(viewController: vc, animated: true) {
                    vc.gameLoad()
                }
            }
            let no = UIAlertAction(title: "buttonSaveAlertNo_message_startGameVC".localized, style: .destructive) { _ in
                UserDefaults.standard.removeObject(forKey: "Checkers")
                UserDefaults.standard.removeObject(forKey: "secondUserName")
                UserDefaults.standard.removeObject(forKey: "scoreGreyPlayer")
                UserDefaults.standard.removeObject(forKey: "scoreWhitePlayer")
                UserDefaults.standard.removeObject(forKey: "Checkers")
                UserDefaults.standard.removeObject(forKey: "timerGame")
                UserDefaults.standard.removeObject(forKey: "playerMove")
                UserDefaults.standard.removeObject(forKey: "move")
                UserDefaults.standard.removeObject(forKey: "chosePlayerCheker")
                
                UIView.animate(withDuration: 0.5){ [weak self] in
                    guard let self = self else { return }
                    self.vsContentView.alpha = 1
                }
            }
            alert.addAction(no)
            alert.addAction(yes)
            self.present(alert, animated: true, completion: nil)
        } else {
            UIView.animate(withDuration: 0.5){ [weak self] in
                guard let self = self else { return }
                self.vsContentView.alpha = 1
            }
        }
    }
    
    @IBAction func buttonScore(_ sender: Any) {
        guard let vc = ScoreViewController.getInstanceViewController as? ScoreViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func choseColorChekersPleyer(_ sender: Any) {
        if choseColorChekersPlayer.selectedSegmentIndex == 0 {
            choseChekers = "white"
        } else {
            choseChekers = "gray"
        }
    }
    
    @IBAction func buttonSettings(_ sender: Any) {
        guard let vc = SettingsViewController.getInstanceViewController as? SettingsViewController else { return }
            navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
        blur.isHidden = false
        activityIndicatorView.startAnimating()
        AdsManager.shared.setupRewarded(viewController: self) { [weak self] in
            self?.activityIndicatorView.stopAnimating()
        } onError: {
            print("Failed to load rewarded ad with error")
            self.blur.isHidden = true
            self.activityIndicatorView.stopAnimating()
            guard let vc = AboutViewController.getInstanceViewController as? AboutViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func vsOkButtonAction(_ sender: Any) {
        UserDefaults.standard.set(vsTextFieldPlayerName?.text ?? "", forKey: "secondUserName")
        guard let vc = StartGameViewController.getInstanceViewController as? StartGameViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
                vc.choseChekerPlayer = self.choseChekers
                vc.timerGame()
    }
    
    @IBAction func vsBackButtonActions(_ sender: Any) {
        UIView.animate(withDuration: 0.5){ [weak self] in
            guard let self = self else { return }
            self.vsTextFieldPlayerName.text = nil
            self.vsContentView.alpha = 0
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
        guard let vc = AboutViewController.getInstanceViewController as? AboutViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
        blur.isHidden = true
    }
}
