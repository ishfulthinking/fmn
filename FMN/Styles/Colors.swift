//
//  Colors.swift
//  FMN
//
//  Created by Perez, Ishmael, Kalil on 3/23/20.
//  Copyright © 2020 Perez, Ishmael, Kalil. All rights reserved.
//

import UIKit

extension UIColor {
    // Convenience constructor to create colors based on hex codes.
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexFormatted: String = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexFormatted.hasPrefix("#") {
            hexFormatted = String(hexFormatted.dropFirst())
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexFormatted).scanHexInt64(&rgbValue)

        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                  green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                  blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                  alpha: alpha)
    }
}

enum Color {
    case fmnPurple
    case fmnYellow
    case fmnPink
    case fmnBlue
    case fmnLightBlue
    case fmnGreen
    case fmnRed
    case fmnLightGray
    case fmnGray
    case fmnDarkGray
    case custom(hex: String, alpha: Double)
    
    func withAlph(_ alpha: Double) -> UIColor {
        return self.value.withAlphaComponent(CGFloat(alpha))
    }
}

extension Color {
    var value: UIColor {
        var colorValue = UIColor.clear
        
        switch self {
            case .fmnPurple:
                colorValue = UIColor(hex: "#8282ED")
            case .fmnYellow:
                colorValue = UIColor(hex: "#EDED82")
            case .fmnPink:
                colorValue = UIColor(hex: "#ED82ED")
            case .fmnBlue:
                colorValue = UIColor(hex: "#82B8ED")
            case .fmnLightBlue:
                colorValue = UIColor(hex: "#82EDED")
            case .fmnGreen:
                colorValue = UIColor(hex: "#82EDED")
            case .fmnRed:
                colorValue = UIColor(hex: "#ED8282")
            case .fmnGray:
                colorValue = UIColor(hex: "#B4B4B4")
            case .fmnLightGray:
                colorValue = UIColor(hex: "#DADADA")
            case .fmnDarkGray:
                colorValue = UIColor(hex: "#8E8E8E")
            case .custom(let hexValue, let alphaValue):
                colorValue = UIColor(hex: hexValue).withAlphaComponent(CGFloat(alphaValue))
        }
        
        return colorValue
    }
}
