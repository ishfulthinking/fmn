//
//  JournalEntry.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/24/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit
import CoreData

extension JournalViewController {
    
    func clearData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            do {
                let entityNames = ["JournalEntry", "Mood"]
                for entityName in entityNames {
                    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
                    let fetchedObjects = try(context.fetch(fetchRequest)) as? [NSManagedObject]
                    for fetchedObject in fetchedObjects! {
                        context.delete(fetchedObject)
                    }
                }
                
                try(context.save())
            } catch let err {
                print(err)
            }
            
        }
    }
    
    func setData() {
        clearData()
        
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            print("OK! Context looks great!")
            
            createJournalEntry(context: context, relativeDate: 0, pleasantness: 1, energy: 0, title: "A good day at the beach", text: "Today I went swimming at the beach. It was a blast!")
//            createJournalEntry(context: context, relativeDate: -2, pleasantness: 1, energy: 1, title: "Universal Studios day!", text: "I think I have a concussion after riding the Hulk 17 times in less than an hour.")
//            createJournalEntry(context: context, relativeDate: -1, pleasantness: -1, energy: 1, title: "Waiting on job application", text: "Super anxious; waiting back to hear from Doofenshmirtz Evil Inc. to see if I got the internship...")
            
            do {
                try(context.save())
            } catch let err {
                print(err)
            }
        }
        
        loadData()
    }
    
    private func createJournalEntry(context: NSManagedObjectContext, relativeDate: Int, pleasantness: Int, energy: Int, title: String, text: String) {
//        let entry = NSEntityDescription.insertNewObject(forEntityName: "JournalEntry", into: context) as! JournalEntry
        
        var dayComponent = DateComponents()
        dayComponent.day = relativeDate
        let entryMood = NSEntityDescription.insertNewObject(forEntityName: "Mood", into: context) as! Mood
        entryMood.pleasantness = Int16(pleasantness)
        entryMood.energy = Int16(energy)
        
        JournalEntry(date: Calendar.current.date(byAdding: dayComponent, to: Date())!, mood: entryMood, title: title, text: text, insertIntoManagedObjectContext: context)
        
        print("Journal entry done!")
    }
    
    func loadData() {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            
            if let entries = fetchJournalEntries() {
                
            }
            
        }
    }
    
    private func fetchJournalEntries() -> [JournalEntry]? {
        let delegate = UIApplication.shared.delegate as? AppDelegate
        if let context = delegate?.persistentContainer.viewContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "JournalEntry")
            
            do {
                entries = try(context.fetch(fetchRequest)) as? [JournalEntry]
            } catch let err {
                print(err)
            }
            
            return entries
        }
        
        return nil
    }
    
}
