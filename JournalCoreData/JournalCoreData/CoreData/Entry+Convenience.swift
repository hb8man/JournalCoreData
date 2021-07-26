//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by William Bateman on 7/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodyText: String, timeStamp: Date = Date(), context: NSManagedObjectContext = coreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timeStamp = timeStamp
    }
    
} // End of Extension


