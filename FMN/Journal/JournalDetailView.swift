//
//  JournalDetailView.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 4/17/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

class JournalDetailView: UIView {
    
    var titleLabel: UILabel
    var moodImage: UIImage?
    var moodColor: UIColor?
    var entryLabel: UILabel
    
    var entry: JournalEntry? {
        didSet {
            titleLabel.text = entry?.title
            moodImage = entry?.mood?.getMoodImage()
            moodColor = entry?.mood?.getMoodColor()
            entryLabel.text = entry?.text
        }
    }
    
    override init(frame: CGRect) {
      super.init(frame: frame)
      setupView()
    }
    
    //initWithCode to init view from xib or storyboard
    required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      setupView()
    }
    
    //common func to init our view
    private func setupView() {
      backgroundColor = .red
    }
}
