//
//  XXZFont.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ------ 定义字体大小 ------
//let Multiple = 1.2

fileprivate func Multiple() -> Float {
    if iPhonePlus {
        return 1.2
    }
    else {
        return 1.0
    }
}

//MARK: ------ 系统正常字体字号 ------
public let FONT_10 = UIFont.systemFont(ofSize: CGFloat( (10.0*Multiple()) ))
public let FONT_11 = UIFont.systemFont(ofSize: CGFloat( (11.0*Multiple()) ))
public let FONT_12 = UIFont.systemFont(ofSize: CGFloat( (12.0*Multiple()) ))
public let FONT_13 = UIFont.systemFont(ofSize: CGFloat( (13.0*Multiple()) ))
public let FONT_14 = UIFont.systemFont(ofSize: CGFloat( (14.0*Multiple()) ))
public let FONT_15 = UIFont.systemFont(ofSize: CGFloat( (15.0*Multiple()) ))
public let FONT_16 = UIFont.systemFont(ofSize: CGFloat( (16.0*Multiple()) ))
public let FONT_17 = UIFont.systemFont(ofSize: CGFloat( (17.0*Multiple()) ))
public let FONT_18 = UIFont.systemFont(ofSize: CGFloat( (18.0*Multiple()) ))
public let FONT_19 = UIFont.systemFont(ofSize: CGFloat( (19.0*Multiple()) ))
public let FONT_20 = UIFont.systemFont(ofSize: CGFloat( (20.0*Multiple()) ))

//MARK: ------ 系统加粗字体字号 ------
public let FONT_BOLD_10 = UIFont.boldSystemFont(ofSize: CGFloat((10.0*Multiple())))
public let FONT_BOLD_11 = UIFont.boldSystemFont(ofSize: CGFloat((11.0*Multiple())))
public let FONT_BOLD_12 = UIFont.boldSystemFont(ofSize: CGFloat((12.0*Multiple())))
public let FONT_BOLD_13 = UIFont.boldSystemFont(ofSize: CGFloat((13.0*Multiple())))
public let FONT_BOLD_14 = UIFont.boldSystemFont(ofSize: CGFloat((14.0*Multiple())))
public let FONT_BOLD_15 = UIFont.boldSystemFont(ofSize: CGFloat((15.0*Multiple())))
public let FONT_BOLD_16 = UIFont.boldSystemFont(ofSize: CGFloat((16.0*Multiple())))
public let FONT_BOLD_17 = UIFont.boldSystemFont(ofSize: CGFloat((17.0*Multiple())))
public let FONT_BOLD_18 = UIFont.boldSystemFont(ofSize: CGFloat((18.0*Multiple())))
public let FONT_BOLD_19 = UIFont.boldSystemFont(ofSize: CGFloat((19.0*Multiple())))
public let FONT_BOLD_20 = UIFont.boldSystemFont(ofSize: CGFloat((20.0*Multiple())))
