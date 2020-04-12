//
//  JournalEntryCell.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/9/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalEntryCell: BaseCell {
    
    var entryData: JournalEntry? {
        didSet {
            dateLabel.text = formatDate(date: entryData?.date!)
            moodImageView.image = entryData?.mood?.getMoodImage()
            titleLabel.text = entryData?.title
            previewLabel.text = entryData?.text
        }
    }
    
    let moodImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "calm")
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 36
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let detailContainerView = UIView()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Untitled"
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "No date"
        label.font = UIFont.systemFont(ofSize: 14, weight: .thin)
        return label
    }()
    
    let previewLabel: UILabel = {
        let label = UILabel()
        label.text = "No preview"
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
    
    func formatDate(date: Date?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        if let rawDate = date {
            return dateFormatter.string(from: rawDate)
        }
        return "No date"
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
        backgroundColor = UIColor.white
    }
}
