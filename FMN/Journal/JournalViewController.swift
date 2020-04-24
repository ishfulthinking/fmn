//
//  JournalViewController.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/23/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "cellId"
    var entries: [JournalEntry]? = []
    let addEntryImage = UIImage(systemName: "add")?.withRenderingMode(.alwaysOriginal)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Journal"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: addEntryImage, style: .plain, target: self, action: #selector(addEntryButtonTapped))
        
        collectionView?.backgroundColor = Color.fmnYellow.value
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(JournalEntryCell.self, forCellWithReuseIdentifier: cellId)
        
        setData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let count = entries?.count {
            return count
        }
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let entryCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! JournalEntryCell
        
        if let entry = entries?[indexPath.item] {
            entryCell.entryData = entry
        }
        
        return entryCell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }
    
    // Open journal detail view
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let layout = UICollectionViewFlowLayout()
//        let controller = JournalDetailViewController(collectionViewLayout: layout)
        let controller = JournalDetailViewController()
        controller.entry = entries?[indexPath.item]
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func addEntryButtonTapped() {
        print("Add entry button tapped!")
    }
}
