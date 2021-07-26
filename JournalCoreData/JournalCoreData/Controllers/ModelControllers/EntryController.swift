//
//  EntryController.swift
//  JournalCoreData
//
//  Created by William Bateman on 7/26/21.
//

import CoreData

class EntryController {

// MARK: Properties
    static let shared = EntryController()
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
        let request = NSFetchRequest<Entry>(entityName: "Entry")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    
// MARK: CRUD Functions
    func createEntryWith(title: String, body: String) {
        let entryToCreate = Entry(title: title, bodyText: body)
        entries.append(entryToCreate)
        
        coreDataStack.saveContext()
    }
    
    func fetchEntries() { // Read
        let entriesToFetch = ( try?
            coreDataStack.context.fetch(fetchRequest)) ?? []
        print(entries.count)
        self.entries = entriesToFetch
    }
    
    func update(entry: Entry, title: String, body: String, timeStamp: Date) {
        entry.title = title
        entry.bodyText = body
        entry.timeStamp = timeStamp
        
        coreDataStack.saveContext()
    }
    
    func delete(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
    }
    
} // End of Class

