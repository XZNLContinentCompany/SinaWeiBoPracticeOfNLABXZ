//
//  DetailNavBarView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class DetailNavBarView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var lastMenu: UIButton?
    var bottomLine: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    func menuAction(_ btn:UIButton) {
        let tag = btn.tag
        XXZLog("tag = \(tag)")
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadMenuButton()
    }
    
    //MARK: ------ loading ------
    func loadMenuButton() {
        let width: CGFloat = self.width/4
        let menuNameArr = ["热门", "榜单", "视频", "头条"]
        
        for i in 0..<4 {
            let btn = UIButton.init(type: UIButtonType.custom)
            btn.frame = CGRect.init(x: CGFloat(i)*width, y: 0, width: width-1, height: self.height)
            
            btn.tag = 1000+i
            btn.titleLabel?.font = FONT_12
            btn.setTitle(menuNameArr[i], for: UIControlState.normal)
            btn.backgroundColor = cyanColor
            self.addSubview(btn)
            
            btn.addTarget(self, action: #selector(menuAction(_ :)), for: UIControlEvents.touchUpInside)
            
            if i == 0 {
                lastMenu = btn
                btn.setTitleColor(redColor, for: UIControlState.normal)
            }
            else {
                btn.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
            }
        }
        
        bottomLine = UIView.init(frame: CGRect.init(x: 10, y: self.height-2, width: width-10*2, height: 2))
        bottomLine?.backgroundColor = redColor
        self.addSubview(bottomLine!)
    }
    
    //MARK: ------ method ------
    func getLastMenuButton(_ index: Int) {
        lastMenu = self.viewWithTag(1000+index) as! UIButton?
        lastMenu?.backgroundColor = redColor
        
        bottomLine?.transform = CGAffineTransform.init(translationX: (lastMenu?.width)!*CGFloat(index), y: 0)
    }
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------

}
