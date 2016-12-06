//
//  MenuView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

protocol MenuViewDelegate {
    func clickMenuView(_ index: CGFloat)
}

class MenuView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var delegate: MenuViewDelegate?
    
    var bottomLine: UIView?
    var lastMenu: UIButton?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    func menuAction(_ btn: UIButton) {
        let tag: CGFloat = CGFloat(btn.tag-1000)
        XXZLog("tag = \(tag)")
        
        if let delegate = delegate {
            lineMovingAnimated(tag)
            delegate.clickMenuView(tag)
            
            lineMoved(tag*self.width)
        }
        else {
            XXZLog("没有实现协议")
        }
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadMenuView()
    }
    
    //MARK: ------ loading ------
    func loadMenuView() {
        let distance_x: CGFloat = 10*RATIO_WIDTH
        let width: CGFloat = (self.width-distance_x*2)/4
        let menuNameArr = ["热门", "榜单", "视频", "头条"]
        
        for i in 0..<4 {
            let menuView = UIButton.init(type: UIButtonType.custom)
            menuView.frame = CGRect.init(x: distance_x+CGFloat(i)*width, y: 0, width: width-1, height: self.height)
            menuView.titleLabel?.font = FONT_12
            menuView.setTitle(menuNameArr[i], for: UIControlState.normal)
            menuView.tag = 1000+i
            self.addSubview(menuView)
            
            if i==0 {
                menuView.setTitleColor(redColor, for: UIControlState.normal)
                lastMenu = menuView
            }
            else {
                menuView.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
            }
            
            menuView.addTarget(self, action: #selector(menuAction(_:)), for: UIControlEvents.touchUpInside)
        }
        
        bottomLine = UIView.init(frame: CGRect.init(x: distance_x+10, y: self.height-2, width: width-10*2, height: 2))
        bottomLine?.backgroundColor = redColor
        self.addSubview(bottomLine!)
    }
    
    //MARK: ------ method ------
    func lineMoving(_ move: CGFloat) {
        let ratio: CGFloat = move/self.width
//        XXZLog("ratio = \(ratio)")
        
        let moveWidth = ratio*((bottomLine?.width)!+10*2)
//        XXZLog("moveWidth = \(moveWidth)")
        
        //线移动
        bottomLine?.transform = CATransform3DGetAffineTransform(CATransform3DMakeTranslation(moveWidth, 0, 0))
    }
    
    func lineMoved(_ move: CGFloat) {
        let ratio: CGFloat = move/self.width
//        XXZLog("ratio = \(ratio)")
        
        //菜单字体颜色更新
        let nowMenu = self.viewWithTag(Int(1000+ratio)) as! UIButton?
        
        //颜色赋值顺序不可变: 先更新标记的, 再更新当前的
        lastMenu?.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
        nowMenu?.setTitleColor(redColor, for: UIControlState.normal)
        
        //将当前 标记
        lastMenu = nowMenu
    }
    
    func lineMovingAnimated(_ move: CGFloat) {
        let moveWidth = move*((bottomLine?.width)!+10*2)
//        XXZLog("moveWidth = \(moveWidth)")
        
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomLine?.transform = CATransform3DGetAffineTransform(CATransform3DMakeTranslation(moveWidth, 0, 0))
        })
    }
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
