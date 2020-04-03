//
//  JournalEntry.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/24/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit
import CoreData

class JournalEntry: NSObject {
    var date: Date?
    var mood: Mood?
    var title: String?
    var text: String?
    
    init(date: Date, moodX: Int, moodY: Int, title: String?, text: String?) {
        self.date = date
        self.mood = Mood.init(x: moodX, y: moodY)
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

extension JournalViewController {
    
    func loadEntries() {
//        let delegate = UIApplication.sharedApplication().delegate as? AppDelegate
//        if let context = delegate?.managedObjectContext {
//            let
//            print("OK! Context looks great!")
//        }
//    }
        
        let entry1 = JournalEntry(date: Date(), moodX: 1, moodY: 0, title: "A Good Day", text: "Today I went to the park and got some ice cream with sprinkles.")
        let entry2 = JournalEntry(date: Date(), moodX: -1, moodY: -1, title: "A Bad Day", text: "Somebody stole my ice cream, and I just got sprinkles on it!")
        let entry3 = JournalEntry(date: Date(), moodX: 2, moodY: 1, title: "A Weird Day", text: "I saw somebody get their ice cream stolen. Sucks to suck!")

        entries?.append(entry1)
        entries?.append(entry2)
        entries?.append(entry3)
    }
}
