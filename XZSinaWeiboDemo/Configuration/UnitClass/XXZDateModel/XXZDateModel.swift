//
//  XXZDateModel.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import Foundation

//MARK: ------ 获取当前日期格式化字符串 ------
/**
 * 获取当前日期格式化字符串
 *
 * parameter format: 不用传参数
 * returns: 格式化当前日期字符串
 */
public func stringWithFormat(_ format: String = "yyyy-MM-dd HH:mm:ss") -> String {
    let formatter = DateFormatter()
//    formatter.dateFormat = format
    formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

    return formatter.string(from: Date.init());
}

//MARK: ----- other


