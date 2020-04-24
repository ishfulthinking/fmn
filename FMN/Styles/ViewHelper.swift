//
//  ViewHelper.swift
//  FMN
//
//  Created by Ishmael Perez on 4/22/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

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
