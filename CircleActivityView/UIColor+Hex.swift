//
//  UIColor+Hex.swift
//  AnimationalBackGroundView
//
//  Created by HLH on 2017/2/16.
//  Copyright © 2017年 胡良海. All rights reserved.
//

import UIKit

extension UIColor {
    class func colorWithHex(hex : UInt32,alpha : CGFloat) -> UIColor {
        let red = CGFloat((hex & 0xff0000) >> 16) / 255
        let green = CGFloat((hex & 0x00ff00) >> 8) / 255
        let blue = CGFloat( hex & 0x0000ff) / 255
        return UIColor.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
