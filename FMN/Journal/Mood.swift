//
//  Mood.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/24/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit
import CoreData

let moodMap: [[String]] = [["depressed", "sad", "anxious"],
                           ["tired", "calm", "excited"],
                           ["relaxed", "happy", "ecstatic"]]

class Mood {
    var pleasantness: Int
    var energy: Int
    var moodName: String?
    
    init(x: Int, y: Int) {
        self.pleasantness = x
        self.energy = y
        moodName = getName(pleasantness: x, energy: y)
    }

    func getName(pleasantness: Int, energy: Int) -> String {
        if pleasantness >= -1 && pleasantness < 2 && energy >= -1 && energy < 2 {
            return moodMap[pleasantness + 1][energy + 1]
        }
        return "calm"
    }

    func getMoodImage() -> UIImage {
        if let _moodName = moodName {
            return UIImage(named: _moodName)!
        }
        return UIImage(named: "calm")!
    }
}
