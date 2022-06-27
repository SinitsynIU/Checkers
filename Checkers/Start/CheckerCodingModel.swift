//
//  CheckerCodingModel.swift
//  Checkers
//
//  Created by Илья Синицын on 23.06.2022.
//

import UIKit


class CheckerCodingModel: NSObject, NSCoding, NSSecureCoding {
    static var supportsSecureCoding: Bool = true
    
    var color: UIColor
    var numberCell: Int
    
    init(color: UIColor, numberCell: Int) {
        self.color = color
        self.numberCell = numberCell
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(color, forKey: "color")
        coder.encode(numberCell, forKey: "numberCell")
    }
    
    required init?(coder: NSCoder) {
        self.numberCell = coder.decodeInteger(forKey: "numberCell")
        self.color = coder.decodeObject(of: UIColor.self, forKey: "color") ?? .white
    }
}
