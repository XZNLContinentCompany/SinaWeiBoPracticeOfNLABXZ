//
//  NLABBackBtn.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABBackBtn: UIButton {
    var title: String = "返回"
    
    init(frame: CGRect, title: String) {
        super.init(frame: frame)
        self.title = title
        layoutViews(title: title)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LayoutViews
    func layoutViews(title: String) {
        if title.characters.count == 0 || title.characters.count > 2 {
            self.title = "返回"
        } else {
            self.title = title
        }
        
//        self.imageView?.image = UIImage.init(named: "LeftBack")
        self.setImage(UIImage.init(named: "LeftBack"), for: UIControlState.normal)
//        self.titleLabel?.text = self.title
        self.titleLabel?.textAlignment = NSTextAlignment.left
        self.titleLabel?.font = FONT_16
        self.setTitle(self.title, for: UIControlState.normal)
        self.setTitleColor(blackColor, for: UIControlState.normal)
        self.titleEdgeInsets = UIEdgeInsetsMake(0, 5 * RATIO_WIDTH, 0, 0)
        
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
