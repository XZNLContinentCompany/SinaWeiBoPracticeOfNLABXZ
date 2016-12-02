//
//  XXZColor.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ------ 定义常用颜色 ------
public let redColor = UIColor.red
public let orangeColor = UIColor.orange
public let yellowColor = UIColor.yellow
public let greenColor = UIColor.green
public let cyanColor = UIColor.cyan
public let blueColor = UIColor.blue
public let purpleColor = UIColor.purple

public let grayColor = UIColor.gray
public let lightGrayColor = UIColor.lightGray
public let darkGrayColor = UIColor.darkGray

public let magentaColor = UIColor.magenta //adj, n 品红, 洋红
public let brownColor = UIColor.brown
public let clearColor = UIColor.clear

public let whiteColor = UIColor.white
public let blackColor = UIColor.black

//MARK: ------ 特殊颜色 ------
public func RGB(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat) -> UIColor {
    let color = UIColor.init(red: (red)/255.0, green: (green)/255.0, blue: (blue)/255.0, alpha: 1.0)
    return color
}

public func RGBWithAlpha(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, _ alpha: CGFloat) -> UIColor {
    let color = UIColor.init(red: (red)/255.0, green: (green)/255.0, blue: (blue)/255.0, alpha: alpha)
    return color
}

///16进制颜色值转换成UIColor
public func UICOLOR_FROM(_ colorString: String) -> UIColor {
    // 存储转换后的数值
    var red:UInt32 = 0, green:UInt32 = 0, blue:UInt32 = 0
    // 计算前缀数量
    var prefixCount = 0
    
    if colorString.hasPrefix("0x") || colorString.hasPrefix("0X") {
        prefixCount = 2 // 前缀有两位
    }
    if colorString.hasPrefix("#") {
        prefixCount = 1 // 前缀有一位
    }
    
    //分别转换进行转换
    Scanner(string: colorString[(0+prefixCount)..<(2+prefixCount)]).scanHexInt32(&red)
    Scanner(string: colorString[(2+prefixCount)..<(4+prefixCount)]).scanHexInt32(&green)
    Scanner(string: colorString[(4+prefixCount)..<(6+prefixCount)]).scanHexInt32(&blue)
    
    return RGB(CGFloat(red), CGFloat(green), CGFloat(blue))
    //UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: 1.0)
}

// string[int..<int]截取字符串
fileprivate extension String {
    subscript (r: Range<Int>) -> String {
        get {
            let startIndex = self.index(self.startIndex, offsetBy: r.lowerBound)
            let endIndex = self.index(self.startIndex, offsetBy: r.upperBound)
            
            return self[startIndex..<endIndex]
        }
    }
}

//MARK: ------ 自定义特定颜色 ------
public let LINE_COLOR = UICOLOR_FROM("#C2C0C6")
public let BACK_COLOR = UICOLOR_FROM("#F0F0F0")

public let UICOLOR_LIGHT = UICOLOR_FROM("#818589")
public let UICOLOR_DARK = UICOLOR_FROM("#2d3841")

