//
//  JournalEntry+CoreDataClass.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//
//

import Foundation
import CoreData

@objc(JournalEntry)
public class JournalEntry: NSManagedObject {
    
    convenience init(date: Date, mood: Mood, title: String, text: String, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        let entity = NSEntityDescription.entity(forEntityName: "JournalEntry", in: context)!
        self.init(entity: entity, insertInto: context)
        self.date = date
        self.mood = mood
        self.title = title
        self.text = text
    }
    
    func formatDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        if let rawDate = date {
            return dateFormatter.string(from: rawDate)
        }
        return "No date"
    }
}
