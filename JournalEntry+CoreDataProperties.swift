//
//  JournalEntry+CoreDataProperties.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//
//

import Foundation
import CoreData


extension JournalEntry {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<JournalEntry> {
        return NSFetchRequest<JournalEntry>(entityName: "JournalEntry")
    }

    @NSManaged public var date: Date?
    @NSManaged public var text: String?
    @NSManaged public var title: String?
    @NSManaged public var mood: Mood?

}
