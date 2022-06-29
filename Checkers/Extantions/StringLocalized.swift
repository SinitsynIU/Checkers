//
//  File.swift
//  Checkers
//
//  Created by Илья Синицын on 03.04.2022.
//

import Foundation

extension String {
    
    var localized: String {
        guard let url = Bundle.main.url(forResource: UserDefaults.standard.string(forKey: "language"), withExtension: "lproj"),
              let langBandel = Bundle(url: url) else {
        return self
        }
        return NSLocalizedString(self, bundle: langBandel, comment: "")
    }
}
