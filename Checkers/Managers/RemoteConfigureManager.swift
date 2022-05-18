//
//  RemoteConfigManager.swift
//  Weather
//
//  Created by Илья Синицын on 07.04.2022.
//

import FirebaseRemoteConfig
import UIKit

class RemoteConfigureManager {
    static let shared = RemoteConfigureManager()
    
    func connectToFirebase(_ onCompleted: @escaping(() -> ())) {
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { status, error in
            if let error = error {
                print(error.localizedDescription)
                onCompleted()
                return
            }
            RemoteConfig.remoteConfig().activate() { _, _ in
                onCompleted()
            }
        }
    }
}
