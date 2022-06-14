//
//  CoreDataManager.swift
//  Checkers
//
//  Created by Илья Синицын on 14.04.2022.
//

import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CheckersDataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    func saveGameInDB(checkers: [Checkers]) {
        let checkersDB =  CheckersDB(context: context)
        checkersDB.setValues(checkers: checkers)
        self.context.insert(checkersDB)
        saveContext()
    }
    
    func getFromDB() -> [Checkers] {
        let request = CheckersDB.fetchRequest()
        let sort = NSSortDescriptor(key: "date", ascending: false)
        request.sortDescriptors = [sort]
        guard let paremeters = try? context.fetch(request) else { return [] }
        return paremeters.map { $0.getMapped() }
    }
    
    func saveContext () {
        let context = context
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func deleteAllInDB() {
        let request = CheckersDB.fetchRequest()
        do {
            let checkersDB = try self.context.fetch(request)
            checkersDB.forEach {
                self.context.delete($0)
            }
            self.saveContext()
            NotificationCenter.default.post(name: NSNotification.Name("CheckersDataBaseDidChange"), object: nil)
            saveContext()
        } catch (let e) {
            print(e.localizedDescription)
        }
    }
}
