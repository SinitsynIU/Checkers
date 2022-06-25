//
//  UserDefaultsSettings.swift
//  Checkers
//
//  Created by Илья Синицын on 23.06.2022.
//

import UIKit

final class UserDefaultsSettings: NSObject {
    
    private enum UserDefaultsKeys: String {
        case firstPlayerName
        case secondPlayerName
        case avatar
        case backgroundColor
        case language
        case enButtonColor
        case ruButtonColor
        case checkerModel
        case timer
        case currentMove
        case playerMove
        case choseChackerPlaying
        case scoreFirstPlayer
        case scoreSecondPlayer
    }
    
    static var firstPlayerName: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.firstPlayerName.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.firstPlayerName.rawValue
            if let name = newValue {
                print("value: (\(name)) was added to key (\(key))")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var secondPlayerName: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.secondPlayerName.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.secondPlayerName.rawValue
            if let name = newValue {
                print("value: (\(name)) was added to key (\(key))")
                defaults.set(name, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var avatar: UIImage? {
        get {
            if let dataImage = UserDefaults.standard.data(forKey: UserDefaultsKeys.avatar.rawValue) {
                return UIImage(data: dataImage)
            }
            return UIImage(systemName: "person.circle")
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.avatar.rawValue
            if let dataImage = newValue?.jpegData(compressionQuality: 0.96) {
                print("image: (\(dataImage)) was added to key (\(key))")
                defaults.set(dataImage, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var backgroundColor: UIColor? {
        get {
            return UserDefaults.standard.colorForKey(key: UserDefaultsKeys.backgroundColor.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.backgroundColor.rawValue
            if let color = newValue {
                print("value: (\(color)) was added to key (\(key))")
                defaults.setColor(color: color, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var language: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.language.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.language.rawValue
            if let lang = newValue {
                print("value: (\(lang)) was added to key (\(key))")
                defaults.set(lang, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var checkerModel: [CheckerCodingModel]? {
        get {
            guard let data = UserDefaults.standard.object(forKey: UserDefaultsKeys.checkerModel.rawValue) as? Data, let decoded = try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [CheckerCodingModel] else { return nil }
            return decoded
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.checkerModel.rawValue
            if let model = newValue {
                print("value: (\(model)) was added to key (\(key))")
                if let data = try? NSKeyedArchiver.archivedData(withRootObject: model, requiringSecureCoding: true) {
                    defaults.set(data, forKey: key)
                }
            }
        }
    }
    
    static var currentMove: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.currentMove.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.currentMove.rawValue
            if let move = newValue {
                print("value: (\(move)) was added to key (\(key))")
                defaults.set(move, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var timer: Int? {
        get {
            return UserDefaults.standard.integer(forKey: UserDefaultsKeys.timer.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.timer.rawValue
            if let timer = newValue {
                print("value: (\(timer)) was added to key (\(key))")
                defaults.set(timer, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var playerMove: String? {
        get { 
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.playerMove.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.playerMove.rawValue
            if let move = newValue {
                print("value: (\(move)) was added to key (\(key))")
                defaults.set(move, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var choseChackerPlaying: String? {
        get {
            return UserDefaults.standard.string(forKey: UserDefaultsKeys.choseChackerPlaying.rawValue)
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.choseChackerPlaying.rawValue
            if let chose = newValue {
                print("value: (\(chose)) was added to key (\(key))")
                defaults.set(chose, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var scoreFirstPlayer: Int? {
        get {
            guard let score = UserDefaults.standard.value(forKey: UserDefaultsKeys.scoreFirstPlayer.rawValue) as? Int else { return nil }
            return score
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.scoreFirstPlayer.rawValue
            if let score = newValue {
                print("value: (\(score)) was added to key (\(key))")
                defaults.set(score, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static var scoreSecondPlayer: Int? {
        get {
            guard let score = UserDefaults.standard.value(forKey: UserDefaultsKeys.scoreSecondPlayer.rawValue) as? Int else { return nil }
            return score
        }
        set {
            let defaults = UserDefaults.standard
            let key = UserDefaultsKeys.scoreSecondPlayer.rawValue
            if let score = newValue {
                print("value: (\(score)) was added to key (\(key))")
                defaults.set(score, forKey: key)
            } else {
                defaults.removeObject(forKey: key)
            }
        }
    }
    
    static func UserDefaultsRemoveAll() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserDefaultsKeys.firstPlayerName.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.avatar.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.backgroundColor.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.language.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.enButtonColor.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.ruButtonColor.rawValue)
        UserDefaultsRemoveGameIsFinish()
    }
    
    static func UserDefaultsRemoveGameIsFinish() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: UserDefaultsKeys.secondPlayerName.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.checkerModel.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.timer.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.currentMove.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.playerMove.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.choseChackerPlaying.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.scoreFirstPlayer.rawValue)
        defaults.removeObject(forKey: UserDefaultsKeys.scoreSecondPlayer.rawValue)
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
