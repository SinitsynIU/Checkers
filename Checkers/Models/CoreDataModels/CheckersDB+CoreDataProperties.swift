//
//  CheckersDB+CoreDataProperties.swift
//  
//
//  Created by Илья Синицын on 14.06.2022.
//
//

import Foundation
import CoreData


extension CheckersDB {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CheckersDB> {
        return NSFetchRequest<CheckersDB>(entityName: "CheckersDB")
    }

    @NSManaged public var nameWhitePlayer: String?
    @NSManaged public var nameGreyPlayer: String?
    @NSManaged public var timer: String?
    @NSManaged public var scoreGreyPlayer: Int64
    @NSManaged public var scoreWhitePlayer: Int64
    @NSManaged public var date: String?

    func getMapped() -> Checkers {
        return Checkers(nameWhitePlayer: nameWhitePlayer ?? "",
                         nameGreyPlayer: nameGreyPlayer ?? "",
                         timer: timer ?? "",
                         scoreGreyPlayer: Int(scoreGreyPlayer),
                         scoreWhitePlayer: Int(scoreWhitePlayer),
                         date: date ?? "")
    }
    
    func setValues(checkers: [Checkers]) {
        self.nameWhitePlayer = checkers.first?.nameWhitePlayer ?? ""
        self.nameGreyPlayer = checkers.first?.nameGreyPlayer ?? ""
        self.timer = checkers.first?.timer ?? ""
        self.scoreGreyPlayer = Int64(checkers.first?.scoreGreyPlayer ?? 0)
        self.scoreWhitePlayer = Int64(checkers.first?.scoreWhitePlayer ?? 0)
        self.date = checkers.first?.date ?? ""
    }
}
