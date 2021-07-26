//
//  DateFormatter.swift
//  JournalCoreData
//
//  Created by William Bateman on 7/26/21.
//

import Foundation

extension DateFormatter {
    
    static let medicationTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        return formatter
    }()
    
    
} // End of Extension

extension Date {
    
    func dateAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        
        return formatter.string(from: self)
    }
    
}
