//
//  XXZStringClass.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/11/18.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ------ 判断字符串是否为空 或并 空格 ------
public func IS_BLANK_STRING(_ string: String) -> Bool {
     var flag = true //是空
    
    if (string.trimmingCharacters(in: CharacterSet.whitespaces).characters.count) != 0 {
        flag = false //非空
    }
    
    return flag
}

//MARK: ------ other ------

