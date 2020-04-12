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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Journal"
        
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
        let layout = UICollectionViewFlowLayout()
        let controller = JournalDetailViewController(collectionViewLayout: layout)
        controller.entry = entries?[indexPath.item]
        navigationController?.pushViewController(controller, animated: true)
    }
}

extension UIView {
    // Helper function for constraint visual format
    func addConstraintsWithFormat(format: String, views: UIView...) {
        var viewsDictionary = [String: UIView]()
        for (index, view) in views.enumerated() {
            let key = "v\(index)"
            viewsDictionary[key] = view
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
    
    enum AxisType {
        case horizontal, vertical
    }
    
    func addCenterConstraint(type: AxisType, view: UIView) {
        addConstraint(NSLayoutConstraint(item: view, attribute: (type == .horizontal ? .centerX : .centerY), relatedBy: .equal, toItem: self, attribute: (type == .horizontal ? .centerX : .centerY), multiplier: 1, constant: 0))
    }
}
