//
//  Settings.swift
//  Checkers
//
//  Created by Илья Синицын on 14.02.2022.
//

import UIKit

class Settings: NSObject {
    enum UserDefaultsKeys: String {
        case onboardingCompleted
        case isAuth
        case avatar
    }
    
    static let shared = Settings()
    
    
    var avatar: UIImage? {
        set {
            isEmptyAvatar = newValue == nil
            if let dataImage = newValue?.jpegData(compressionQuality: 0.96) {
                UserDefaults.standard.set(dataImage, forKey: avatar.rawValue)
            } else {
                UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.avatar.rawValue)
            }
        }
        
        get {
            if let dataImage = UserDefaults.standard.data(forKey: UserDefaultsKeys.avatar.rawValue) {
                return UIImage(data: dataImage)
            }
            
            return UIImage(named: "empty_avatar_secret")
        }
    }
    
    var isEmptyAvatar: Bool
    
    override init() {
        isEmptyAvatar = UserDefaults.standard.data(forKey: UserDefaultsKeys.avatar.rawValue) == nil
        
        super.init()
    }
}
