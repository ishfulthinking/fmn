//
//  Images.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/23/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

extension UIImage {
   static func imageWithColor(tintColor: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        tintColor.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return image
    }
}
