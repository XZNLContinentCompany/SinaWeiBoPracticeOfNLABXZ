//
//  XXZFrame.swift
//  Author From Xavier Zachary
//
//  Created by Zachary on 16/9/5.
//  Copyright © 2016年 com.xxzing.future. All rights reserved.
//

import UIKit

//MARK: ----- 当前屏幕的宽高
public let SCREEN_BOUNDS = UIScreen.main.bounds
public let SCREEN_SIZE = SCREEN_BOUNDS.size
public let SCREEN_WIDTH = SCREEN_SIZE.width
public let SCREEN_HEIGHT = SCREEN_SIZE.height

public let RATIO_WIDTH = SCREEN_WIDTH/320
public let RATIO_HEIGHT = SCREEN_HEIGHT/480

public let STATUS_BAR_HEIGHT: CGFloat = 20
public let NAV_BAR_HEIGHT: CGFloat = 44
public let STATUS_TAB_HEIGHT = STATUS_BAR_HEIGHT+NAV_BAR_HEIGHT
public let TOOL_BAR_HEIGHT: CGFloat = 49
public let BOTTOM_HEIGHT: CGFloat = 50

//MARK: ----- 当前视图的四个值
public func X (_ object: UIView) -> CGFloat {
    return object.frame.origin.x
}

public func Y (_ object: UIView) -> CGFloat {
    return object.frame.origin.y
}

public func WIDTH (_ object: UIView) -> CGFloat {
    return object.frame.size.width
}

public func HEIGHT (_ object: UIView) -> CGFloat {
    return object.frame.size.height
}

//MARK: ------ extension ------
public extension CGRect {
    /// 默认的位置
    public var rect: CGRect {
        return self
    }
    
    /// 距离 x
    public var x: CGFloat {
        return self.origin.x
    }
    
    /// 距离 y
    public var y: CGFloat {
        return self.origin.y
    }
    
    /// 宽
    public var width: CGFloat {
        return self.size.width
    }
    
    /// 高
    public var height: CGFloat {
        return self.size.height
    }
}

public extension UIView {
    /// 距离 x
    public var x: CGFloat {
        return self.frame.origin.x
    }
    /// 距离 y
    public var y: CGFloat {
        return self.frame.origin.y
    }
    /// 宽
    public var width: CGFloat {
        return self.frame.size.width
    }
    /// 高
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    /// 最小 x
    public var minX: CGFloat {
        return self.frame.origin.x
    }
    /// 最大 x
    public var maxX: CGFloat {
        return self.frame.origin.x+self.frame.size.width
    }
    /// 最小 y
    public var minY: CGFloat {
        return self.frame.origin.y
    }
    /// 最大 y
    public var maxY: CGFloat {
        return self.frame.origin.y+self.frame.size.height
    }
}

//MARK: ----- other

