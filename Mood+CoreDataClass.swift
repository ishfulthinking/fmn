//
//  Mood+CoreDataClass.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//
//

import UIKit
import CoreData

let moodMap: [[String]] = [["depressed", "sad", "anxious"],
                            ["tired", "calm", "excited"],
                            ["relaxed", "happy", "ecstatic"]]

let moodColorMap: [[UIColor]] = [[Color.fmnPurple.value, Color.fmnBlue.value, Color.fmnYellow.value],
                                 [Color.fmnPurple.value, Color.fmnLightGray.value, Color.fmnYellow.value],
                                 [Color.fmnPurple.value, Color.fmnBlue.value, Color.fmnYellow.value]]

@objc(Mood)
public class Mood: NSManagedObject {

    convenience init(pleasantness: Int, energy: Int, insertIntoManagedObjectContext context: NSManagedObjectContext!) {
        let entity = NSEntityDescription.entity(forEntityName: "JournalEntry", in: context)!
        self.init(entity: entity, insertInto: context)
        self.pleasantness = Int16(pleasantness)
        self.energy = Int16(energy)
//        setName()
    }
    
    private func setName() {
        if pleasantness >= -1 && pleasantness < 2 && energy >= -1 && energy < 2 {
            self.name = moodMap[Int(pleasantness) + 1][Int(energy) + 1]
        } else {
            self.name = "calm"
        }
    }
    
    func getMoodImage() -> UIImage! {
        if let _name = name {
            return UIImage(named: _name)!
        }
        return UIImage(named: "calm")!
    }
    
    func getMoodColor() -> UIColor {
        if pleasantness >= -1 && pleasantness < 2 && energy >= -1 && energy < 2 {
            return moodColorMap[Int(pleasantness) + 1][Int(energy) + 1]
        }
        return moodColorMap[0][0]
    }
}
