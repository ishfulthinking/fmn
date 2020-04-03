//
//  DashboardViewController.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/23/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class DashboardViewController: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Dashboard"
        
        collectionView?.backgroundColor = Color.fmnPurple.value
        print("Successfully green baybee")
    }
}
