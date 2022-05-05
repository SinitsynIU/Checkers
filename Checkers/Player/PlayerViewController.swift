//
//  SettingsViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 08.02.2022.
//

import UIKit
import LTMorphingLabel

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
    
    var choseChekers: String = "white"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupLocalization()
        getPlayerName()
        getPlayerAvatar()
        setupUI()
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
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
        view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
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
    
    @IBAction func buttonStart(_ sender: Any) {
        if UserDefaults.standard.object(forKey: "Checkers") != nil {
            let alert = UIAlertController(title: nil, message: "buttonStartAlert_message_playerVC".localized, preferredStyle: .alert)
            let yes = UIAlertAction(title: "buttonSaveAlertYes_message_startGameVC".localized, style: .default) { _ in
            if let vc = UIStoryboard(name: "StartGameViewController", bundle: nil).instantiateInitialViewController() as? StartGameViewController {
                self.navigationController?.pushViewController(viewController: vc, animated: true) {
                    vc.gameLoad()
                }
                }
            }
            let no = UIAlertAction(title: "buttonSaveAlertNo_message_startGameVC".localized, style: .cancel) { _ in
                if let vc = UIStoryboard(name: "StartGameViewController", bundle: nil).instantiateInitialViewController() as? StartGameViewController {
                    self.navigationController?.pushViewController(vc, animated: true)
                    vc.choseChekerPlayer = self.choseChekers
                    vc.timerGame()
                }
            }
            alert.addAction(no)
            alert.addAction(yes)
            self.present(alert, animated: true, completion: nil)
        } else {
            if let vc = UIStoryboard(name: "StartGameViewController", bundle: nil).instantiateInitialViewController() as? StartGameViewController {
                self.navigationController?.pushViewController(vc, animated: true)
                vc.choseChekerPlayer = self.choseChekers
                vc.timerGame()
                }
        }
    }
    
    @IBAction func buttonScore(_ sender: Any) {
        if let vc = UIStoryboard(name: "ScoreViewController", bundle: nil).instantiateInitialViewController() as? ScoreViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func choseColorChekersPleyer(_ sender: Any) {
        if choseColorChekersPlayer.selectedSegmentIndex == 0 {
            choseChekers = "white"
        } else {
            choseChekers = "gray"
        }
    }
    
    @IBAction func buttonSettings(_ sender: Any) {
        if let vc = UIStoryboard(name: "SettingsViewController", bundle: nil).instantiateInitialViewController() as? SettingsViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    @IBAction func buttonAbout(_ sender: Any) {
        if let vc = UIStoryboard(name: "AboutViewController", bundle: nil).instantiateInitialViewController() as? AboutViewController {
            navigationController?.pushViewController(vc, animated: true)
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
