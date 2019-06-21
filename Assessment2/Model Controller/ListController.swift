//
//  ListController.swift
//  Assessment2
//
//  Created by Drew Seeholzer on 6/21/19.
//  Copyright © 2019 Drew Seeholzer. All rights reserved.
//

import Foundation
import CoreData

class ListController {
    
    static let sharedInstance = ListController()
    
    var items: [List] {
        let request: NSFetchRequest<List> = List.fetchRequest()
        
        return (try? CoreDataStack.managedObjectContext.fetch(request)) ?? []
    }
    
    func addItem(item: String) {
        List(item: item)
        saveToPersistentStore()
        
    }
    
    func delete(listItem: List) {
        if let moc = listItem.managedObjectContext {
            moc.delete(listItem)
            saveToPersistentStore()
        }
    }
    
    
    func saveToPersistentStore() {
        let moc = CoreDataStack.managedObjectContext
        do {
            try moc.save()
        } catch {
            print("Error saving to moc: \(error.localizedDescription)")
        }
    }
}
