//
//  XXZLog.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ----- XXZLog
/**
 * 输出日志
 *
 * parameter message:  日志消息
 * parameter file:     文件名
 * parameter method:   方法名
 * parameter line:     代码行数
 */
public func XXZLog<agr>(_ message:agr, file: String = #file, function: String = #function, line: Int = #line) {
    print("= >> \(stringWithFormat())  [\((file as NSString).lastPathComponent)]: [\(line): \(function)]\n= >> \(message)\n---------------------------------------------------------------------------------------------------")
    
//    print("= >> \(message)")
//    print("---------------------------------------------------------------------------------------------------\n")
}

//MARK: ----- other
