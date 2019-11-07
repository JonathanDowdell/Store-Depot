//
//  UIColor+Theme.swift
//  Store Depot
//
//  Created by Jonathan Dowdell on 11/6/19.
//  Copyright © 2019 Jonathan Dowdell. All rights reserved.
//

import UIKit

extension UIColor {
    /**
     Accepts Hex values for UIColor
     */
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }

    convenience init(_ rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
    
    /**
     Default Text Theme Gray 99%
    */
    static let gray99 = UIColor(0x455154)
    static let gray99Dynamic:UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return UIColor.white
                } else {
                    /// Return the color for Light Mode
                    return UIColor(0x455154)
                }
            }
        } else {
            /// Return a fallback color for iOS 12 and lower.
            return UIColor(0x455154)
        }
    }()
    
    /**
     Gray 79%
    */
    static let gray79 = UIColor(0x969FA2)
    
    /**
     Gray 59%
    */
    static let gray59 = UIColor(0xC4CACC)
    
    /**
     Gray 39%
    */
    static let gray39 = UIColor(0xE7EAEB)
    
    /**
     Gray 19%
    */
    static let gray19 = UIColor(0xF4F6F6)
    
    /**
     Base Color
    */
    static let baseColor = UIColor(0x59B58D)
    
    /**
     Dynamic White
    */
    static let whiteDynamic: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return UIColor.systemGray6
                } else {
                    /// Return the color for Light Mode
                    return UIColor.white
                }
            }
        } else {
            /// Return a fallback color for iOS 12 and lower.
            return UIColor.white
        }
    }()
    
}
