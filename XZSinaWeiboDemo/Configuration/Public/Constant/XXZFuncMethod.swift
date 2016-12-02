//
//  XXZFuncMethod.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ------ 判断哪个屏幕的设备 ------
//比较宽高是否一致
private func isWhichDevice (size: CGSize) -> Bool {
    let flag = __CGSizeEqualToSize(size, SCREEN_SIZE)
    
//    XXZLog("\(size)")
//    XXZLog("\(SCREEN_SIZE)")
//    XXZLog("\(flag)")
    
    return flag
}

// 4/4s                 320.0, 480.0
// 5/5s/SE           320.0, 568.0
// 6/6s/7              375.0, 667.0
// 6/6s/7 plus      414.0 736.0
public let iPhoneFourSeries = isWhichDevice (size: CGSize.init(width: 320.0, height: 480.0))
public let iPhoneFiveSeries = isWhichDevice (size: CGSize.init(width: 320.0, height: 568.0))
public let iPhoneSixSeries = isWhichDevice (size: CGSize.init(width: 375.0, height: 667.0))
public let iPhonePlus = isWhichDevice (size: CGSize.init(width: 414.0, height: 736.0))

//MARK: ------ 定义新增方法 ------


