//
//  JournalDetailViewController.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/10/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalDetailViewController: UIViewController {
    
    let journalDetailView = JournalDetailView()
    let editEntryImage = UIImage(systemName: "compose")?.withRenderingMode(.alwaysOriginal)
    let saveEntryImage = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
    let cancelEntryImage = UIImage(named: "stop")?.withRenderingMode(.alwaysOriginal)
    
    var entry: JournalEntry? {
        didSet {
            navigationItem.title = String(entry?.formatDate() ?? "No date")
            journalDetailView.entry = entry
        }
    }
    
    override func loadView() {
        view = journalDetailView
        // Avoid the journalDetailView from hiding behind the top NavigationBar
        edgesForExtendedLayout = []
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: editEntryImage, style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    @objc private func editButtonTapped() {
        print("Edit button tapped!")
    }
}
