//
//  Nib.swift
//  Checkers
//
//  Created by Илья Синицын on 23.06.2022.
//

import UIKit

extension UIView {
    
    class func loadFromNib<T: UIView>() -> T {
        return Bundle.main.loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
    
}
