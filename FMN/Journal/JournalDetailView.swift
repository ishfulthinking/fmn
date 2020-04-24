//
//  JournalDetailView.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/17/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalDetailView: UIView {
    
    var entry: JournalEntry? {
        didSet {
            titleLabel.text = entry?.title
            moodImageView.image = entry?.mood?.getMoodImage()
            moodColor = entry?.mood?.getMoodColor() ?? .black
            entryLabel.text = entry?.text
        }
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var stackView: UIStackView = {
        var stackView = UIStackView()
        stackView.backgroundColor = .blue
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 0
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    let headerView: UIView = {
        let headerView = UIView()
        headerView.backgroundColor = .yellow
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Untitled"
        titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return titleLabel
    }()
    
    let moodImageView: UIImageView = {
        let moodImageView = UIImageView()
        moodImageView.image = UIImage(named: "calm")
        moodImageView.contentMode = .scaleAspectFill
        moodImageView.layer.cornerRadius = 20
        moodImageView.layer.masksToBounds = true
        moodImageView.translatesAutoresizingMaskIntoConstraints = false
        return moodImageView
    }()
    
    var moodColor: UIColor = {
        let moodColor = UIColor.purple
        return moodColor
    }()
    
    let entryView: UIView = {
        let entryView = UIView()
        entryView.backgroundColor = .brown
        entryView.translatesAutoresizingMaskIntoConstraints = false
        return entryView
    }()
    
    let entryLabel: UILabel = {
        let entryLabel = UILabel()
        entryLabel.text = "Entry is empty"
        entryLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
        entryLabel.lineBreakMode = .byWordWrapping
        entryLabel.numberOfLines = 0
        return entryLabel
    }()
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    private func setupView() {
        backgroundColor = .black
        
        addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: self.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        directionalLayoutMargins = NSDirectionalEdgeInsets(top: -20, leading: 20, bottom: 20, trailing: 20)
        
        scrollView.addSubview(stackView)
        NSLayoutConstraint.activate([
          stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
          stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
          stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
          stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
//          stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
//        stackView.layoutMargins = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        
        stackView.addArrangedSubview(headerView)
        headerView.addSubview(moodImageView)
        moodImageView.backgroundColor = moodColor
        headerView.addSubview(titleLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0(40)]-16-[v1]-8-|", views: moodImageView, titleLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0(40)]-8-|", views: moodImageView)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: titleLabel)
        
        stackView.addArrangedSubview(entryView)
        entryView.addSubview(entryLabel)
        addConstraintsWithFormat(format: "H:|-8-[v0]-8-|", views: entryLabel)
        addConstraintsWithFormat(format: "V:|-8-[v0]-8-|", views: entryLabel)
    }
}
