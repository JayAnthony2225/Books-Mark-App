//
//  UIColor++.swift
//  Books-Mark-App
//
//  Created by Marco Cruz Velázquez on 2/24/22.
//
import UIKit

extension UIColor {
    static var nightBlue: UIColor = UIColor(hex: 0x1B262C, alpha: 1)
    static var darkBlue: UIColor = UIColor(hex: 0x0F4C75, alpha: 1)
    static var seaBlue: UIColor = UIColor(hex: 0x3282B8, alpha: 1)
    static var skyBlue: UIColor = UIColor(hex: 0xBBE1FA, alpha: 1)
    
    convenience init(hex: Int, alpha: CGFloat) {
        let red: Int = (hex >> 16) & 0xFF
        let green: Int = (hex >> 8) & 0xFF
        let blue: Int = hex & 0xFF
        self.init(red: CGFloat(red) / 255, green: CGFloat(green) / 255, blue: CGFloat(blue) / 255, alpha: alpha)
    }
}
/*
var darkBlue: UIColor = UIColor(displayP3Red: 29/255, green: 36/255, blue: 43/255, alpha: 1)
var whiteTextColor: UIColor = UIColor(displayP3Red: 240/255, green: 240/255, blue: 240/255, alpha: 1)
var lightBTextColor: UIColor = UIColor(displayP3Red: 199/255, green: 238/255, blue: 255/255, alpha: 1)
var blueTextColor: UIColor = UIColor(displayP3Red: 0/255, green: 119/255, blue: 192/255, alpha: 1)
var grisTextColor: UIColor = UIColor(displayP3Red: 57/255, green: 62/255, blue: 70/255, alpha: 1)
*/

