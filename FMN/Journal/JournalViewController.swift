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
        
        collectionView?.backgroundColor = Color.fmnGray.value
        collectionView?.alwaysBounceVertical = true
        
        collectionView?.register(JournalEntryCell.self, forCellWithReuseIdentifier: cellId)
        
        loadEntries()
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
}

class JournalEntryCell: BaseCell {
    
    var entryData: JournalEntry? {
        didSet {
            dateLabel.text = entryData?.formatDate()
            moodImageView.image = entryData?.mood?.getMoodImage()
            titleLabel.text = entryData?.title
            previewLabel.text = entryData?.text
        }
    }
    
    let moodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "sad")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 36
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let detailContainerView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Ishi Minaj"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "31 December 2019"
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "Today I went to the park and got some ice cream with sprinkles."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = Color.fmnGray.value
        return label
    }()
    
    override func setupViews() {
        backgroundColor = UIColor.white
        
        setupContainerView()
        
        addSubview(moodImageView)
        moodImageView.image = UIImage(named: "happy")
        moodImageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraintsWithFormat(format: "H:|-8-[v0(72)]", views: moodImageView)
        addConstraintsWithFormat(format: "V:|-14-[v0(72)]-14-|", views: moodImageView)
        
        addSubview(detailContainerView)
        addConstraintsWithFormat(format: "H:|-94-[v0]-8-|", views: detailContainerView)
        addConstraintsWithFormat(format: "V:|-8-[v0(84)]", views: detailContainerView)
        addCenterConstraint(type: .vertical, view: detailContainerView)
    }
    
    private func setupContainerView() {
        let headerContainerView = UIView()
        headerContainerView.addSubview(titleLabel)
        headerContainerView.addSubview(dateLabel)
        headerContainerView.addConstraintsWithFormat(format: "H:|[v0]-(>=8)-[v1]|", views: titleLabel, dateLabel)
        
        detailContainerView.addSubview(headerContainerView)
        detailContainerView.addSubview(previewLabel)
        detailContainerView.addConstraintsWithFormat(format: "H:|[v0]|", views: headerContainerView)
        detailContainerView.addConstraintsWithFormat(format: "V:|[v0(24)]-8-[v1]|", views: headerContainerView, previewLabel)
        detailContainerView.addConstraintsWithFormat(format: "H:|[v0]|", views: previewLabel)
    }
}

extension UIView {
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

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init of BaseCell in JournalViewController failed")
    }
    
    func setupViews() {
        backgroundColor = Color.fmnLightGray.value
    }
}
