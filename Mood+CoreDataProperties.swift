//
//  Mood+CoreDataProperties.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//
//

import Foundation
import CoreData


extension Mood {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Mood> {
        return NSFetchRequest<Mood>(entityName: "Mood")
    }

    @NSManaged public var energy: Int16
    @NSManaged public var name: String?
    @NSManaged public var pleasantness: Int16
    @NSManaged public var journalEntry: NSSet?

}

// MARK: Generated accessors for journalEntry
extension Mood {

    @objc(addJournalEntryObject:)
    @NSManaged public func addToJournalEntry(_ value: JournalEntry)

    @objc(removeJournalEntryObject:)
    @NSManaged public func removeFromJournalEntry(_ value: JournalEntry)

    @objc(addJournalEntry:)
    @NSManaged public func addToJournalEntry(_ values: NSSet)

    @objc(removeJournalEntry:)
    @NSManaged public func removeFromJournalEntry(_ values: NSSet)

}
