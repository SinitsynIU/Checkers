//
//  SetViewController.swift
//  Checkers
//
//  Created by Илья Синицын on 10.02.2022.
//

import UIKit
import SwiftEntryKit
import GoogleMobileAds

struct BgColor {
    let color: UIColor
    let title: String
}

class SettingsViewController: UIViewController, UINavigationControllerDelegate, UITextFieldDelegate {
    
    @IBOutlet weak var bunnerView: GADBannerView!
    @IBOutlet weak var avButton: UIButton!
    @IBOutlet weak var settingsLabel: UILabel!
    @IBOutlet weak var changeAvatarLabel: UILabel!
    @IBOutlet weak var changeLangLabel: UILabel!
    @IBOutlet weak var enLangButton: UIButton!
    @IBOutlet weak var ruLangButton: UIButton!
    @IBOutlet weak var changeBgColorLabel: UILabel!
    @IBOutlet weak var bgColorPicker: UIPickerView!
    @IBOutlet weak var changePlayerNameTextField: UITextField!
    @IBOutlet weak var avatarView: UIImageView!
    @IBOutlet weak var saveButton: ButtonCustom!
    @IBOutlet weak var backButton: ButtonCustom!
    
    var langCode = ["en", "ru"]
    var imageAv: UIImage?
    var language: String = "en"
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
        //self.hideKeyboardWhenTappedAround()
        setupLocalization()
        setupUI()
        changePlayerNameTextField.delegate = self
        bgColorPicker.delegate = self
        bgColorPicker.dataSource = self
        imageAvViewLoad()
        AdsManager.shared.setupBunner(bannerView: bunnerView, viewController: self)
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
        if UserDefaults.standard.colorForKey(key: "bgColor") == nil {
            view.backgroundColor = .white
        } else {
        view.backgroundColor = UserDefaults.standard.colorForKey(key: "bgColor")
        }
        if UserDefaults.standard.colorForKey(key: "enButtonColor") == nil {
            enLangButton.backgroundColor = .lightGray
        } else {
            enLangButton.backgroundColor = UserDefaults.standard.colorForKey(key: "enButtonColor")
        }
        if UserDefaults.standard.colorForKey(key: "ruButtonColor") == nil {
            ruLangButton.backgroundColor = .lightGray
        } else {
            ruLangButton.backgroundColor = UserDefaults.standard.colorForKey(key: "ruButtonColor")
        }
    }
    
    private func setupLocalization() {
        settingsLabel.text = "settingsLabel_text_setVC".localized
        changeAvatarLabel.text = "changeAvatarLabel_text_setVC".localized
        changeLangLabel.text = "changeAvatarLabel_text_setVC".localized
        changeBgColorLabel.text = "changeBgColorLabel_text_setVC".localized
        saveButton.text = "saveButton_text_setVC".localized
        backButton.text = "backButton_text_setVC".localized
        changePlayerNameTextField.placeholder = "changePlayerNameTextField_placeholder_setVC".localized
    }
    
    private func imageAvViewLoad () {
        if let dataImageAv = UserDefaults.standard.data(forKey: "avatarImageView") {
            return self.avatarView.image = UIImage(data: dataImageAv)
        }
    }
    
    @IBAction func buttonSaveAction(_ sender: Any) {
        let alert = UIAlertController(title: nil, message: "buttonSaveAlert_message_setVC".localized, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ок", style: .default) { _ in
            if let dataImageAv = self.imageAv?.jpegData(compressionQuality: 0.96) {
                UserDefaults.standard.set(dataImageAv, forKey: "avatarImageView")
            }
            UserDefaults.standard.setColor(color: self.view.backgroundColor , forKey: "bgColor")
            UserDefaults.standard.set(self.language, forKey: "language")
            if self.changePlayerNameTextField?.text != nil ?? "" {
            UserDefaults.standard.set(self.changePlayerNameTextField?.text ?? "", forKey: "userName")
            }
            UserDefaults.standard.setColor(color: self.enLangButton.backgroundColor, forKey: "enButtonColor")
            UserDefaults.standard.setColor(color: self.ruLangButton.backgroundColor, forKey: "ruButtonColor")
            self.setupLocalization()
            self.bgColorPicker.reloadAllComponents()
        }
        alert.addAction(ok)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func buttonBackAction(_ sender: Any) {
        if let vc = UIStoryboard(name: "PlayerViewController", bundle: nil).instantiateInitialViewController() as? PlayerViewController {
            navigationController?.pushViewController(vc, animated: true)
        }
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
            enLangButton.backgroundColor = .orange
            ruLangButton.backgroundColor = .lightGray
        }
        if sender.tag == 1 {
            ruLangButton.backgroundColor = .orange
            enLangButton.backgroundColor = .lightGray
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

extension UserDefaults {
    
  func colorForKey(key: String) -> UIColor? {
    var colorReturnded: UIColor?
    if let colorData = data(forKey: key) {
      do {
        if let color = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(colorData) as? UIColor {
          colorReturnded = color
        }
      } catch {
        print("Error UserDefaults")
      }
    }
    return colorReturnded
  }
  
  func setColor(color: UIColor?, forKey key: String) {
    var colorData: NSData?
    if let color = color {
      do {
        let data = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
        colorData = data
      } catch {
        print("Error UserDefaults")
      }
    }
    set(colorData, forKey: key)
  }
}
