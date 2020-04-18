//
//  JournalDetailViewController.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalDetailViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var entry: JournalEntry? {
        didSet {
            navigationItem.title = String(entry?.formatDate() ?? "No date")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = entry?.mood?.getMoodColor()
    }
    
    
}
