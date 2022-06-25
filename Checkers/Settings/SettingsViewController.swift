//
//  SetViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 10.02.2022.
//

import UIKit
import GoogleMobileAds

struct BgColor {
    let color: UIColor
    let title: String
}

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var bunnerView: GADBannerView!
    @IBOutlet weak var avButton: UIButton!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var usaMarkImageView: UIImageView!
    @IBOutlet weak var russianMarkImageView: UIImageView!
    @IBOutlet weak var changeLangLabel: UILabel!
    @IBOutlet weak var editProfileView: UIView!
    @IBOutlet weak var enLangButton: UIButton!
    @IBOutlet weak var ruLangButton: UIButton!
    @IBOutlet weak var changeBgColorLabel: UILabel!
    @IBOutlet weak var bgColorPicker: UIPickerView!
    @IBOutlet weak var changePlayerNameTextField: UITextField!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var saveButton: ButtonCustom!
    @IBOutlet weak var backButton: ButtonCustom!
    
    private lazy var alertView: AlertView = {
        let alertView: AlertView = AlertView.loadFromNib()
        alertView.delegateLeftButton = self
        return alertView
    }()
    
    var langCode = ["en", "ru"]
    var imageAv: UIImage?
    var language: String?
    var colors: [BgColor] = [
        BgColor(color: .white, title: "white_arrayColors"),
        BgColor(color: .green, title: "green_arrayColors"),
        BgColor(color: .yellow, title: "yellow_arrayColors"),
        BgColor(color: .blue, title: "blue_arrayColors"),
        BgColor(color: .orange, title: "orange_arrayColors"),
        BgColor(color: .brown, title: "brown_arrayColors"),
        BgColor(color: .gray, title: "gray_arrayColors"),
        BgColor(color: .cyan, title: "cyan_arrayColors"),
        BgColor(color: .purple, title: "purple_arrayColors"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        changePlayerNameTextField.delegate = self
        bgColorPicker.delegate = self
        bgColorPicker.dataSource = self
        setupLocalization()
        getUserSettings()
        AdsManager.shared.setupBunner(bannerView: bunnerView, viewController: self)
    }
    
    func setAlert() {
        view.addSubview(alertView)
        alertView.center = view.center
        alertView.set(title: "titelAlert_text_settingVC".localized, body: "buttonSaveAlert_message_setVC".localized, leftButtonTitle: "OK")
    }
    
    func animateIn() {
        alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        alertView.alpha = 0
        
        UIView.animate(withDuration: 0.4) {
            self.alertView.alpha = 1
            self.alertView.transform = CGAffineTransform.identity
        }
    }
    
    func animateOut() {
        UIView.animate(withDuration: 0.4,
                       animations: {
                        self.alertView.alpha = 0
                        self.alertView.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
        }) { (_) in
           self.alertView.removeFromSuperview()
        }
    }
    
    private func setupUI() {
        self.overrideUserInterfaceStyle = .light
        avatarView.layer.cornerRadius = 75
        changePlayerNameTextField.layer.cornerRadius = 25
        changePlayerNameTextField.layer.borderWidth = 1
        enLangButton.layer.cornerRadius = 15
        enLangButton.layer.borderWidth = 1
        ruLangButton.layer.cornerRadius = 15
        ruLangButton.layer.borderWidth = 1
        editProfileView.layer.cornerRadius = 10
    }
    
    private func setupLocalization() {
        settingsLabel.text = "settingsLabel_text_setVC".localized
        changeLangLabel.text = "changeLangLabel_text_setVC".localized
        changeBgColorLabel.text = "changeBgColorLabel_text_setVC".localized
        saveButton.text = "saveButton_text_setVC".localized
        backButton.text = "backButton_text_setVC".localized
        changePlayerNameTextField.placeholder = "changePlayerNameTextField_placeholder_setVC".localized
    }
    
    private func getUserSettings () {
        if UserDefaultsSettings.avatar == nil {
            avatarView.image = UIImage(systemName: "person.circle")
        } else {
            avatarView.image = UserDefaultsSettings.avatar
        }
        if UserDefaultsSettings.backgroundColor == nil {
            view.backgroundColor = .white
        } else {
            view.backgroundColor = UserDefaultsSettings.backgroundColor
        }
        
        if UserDefaultsSettings.language == nil {
            usaMarkImageView.isHidden = false
            russianMarkImageView.isHidden = true
        } else if UserDefaultsSettings.language == "en" {
            usaMarkImageView.isHidden = false
            russianMarkImageView.isHidden = true
        } else {
            usaMarkImageView.isHidden = true
            russianMarkImageView.isHidden = false
        }
    }
    
    @IBAction func buttonSaveAction(_ sender: Any) {
        setAlert()
        animateIn()
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        guard let vc = PlayerViewController.getInstanceViewController as? PlayerViewController else { return }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func avatarImageViewChange(_ sender: Any) {
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func changeLanguage(_ sender: UIButton) {
        language = langCode[sender.tag]
        if sender.tag == 0 {
            usaMarkImageView.isHidden = false
            russianMarkImageView.isHidden = true
        } else {
            usaMarkImageView.isHidden = true
            russianMarkImageView.isHidden = false
        }
    }
}

extension SettingsViewController: UIImagePickerControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return colors.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return colors[row].title.localized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        view.backgroundColor = colors[row].color
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let imageAv = info[.editedImage] as? UIImage {
                self.imageAv = imageAv
                self.avatarView.image = imageAv
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

extension SettingsViewController: AlertDelegateLeftButton {
    
    func leftButtonTapped() {
        animateOut()
        if imageAv != nil {
            UserDefaultsSettings.avatar = imageAv
        }
        UserDefaultsSettings.backgroundColor = view.backgroundColor
        UserDefaultsSettings.language = language
        if changePlayerNameTextField?.text != "" {
            UserDefaultsSettings.firstPlayerName = changePlayerNameTextField?.text ?? ""
        }
        setupLocalization()
        getUserSettings()
        bgColorPicker.reloadAllComponents()
    }
}
