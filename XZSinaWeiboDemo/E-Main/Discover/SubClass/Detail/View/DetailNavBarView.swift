//
//  DetailNavBarView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

protocol DetailNavBarViewDelegate {
    func detailNavBarView(_ index: Int)
}

class DetailNavBarView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var delegate: DetailNavBarViewDelegate?
    
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
        if let delegate = delegate {
            let tag = btn.tag-1000
//            XXZLog("tag = \(tag)")
            
            lastMenu?.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
            btn.setTitleColor(redColor, for: UIControlState.normal)
            lastMenu = btn
            
            clickMenuMovingAnimated(tag)
            delegate.detailNavBarView(tag)
        }
        else {
            XXZLog("没有实现协议")
        }
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
//            btn.backgroundColor = cyanColor
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
    func scrollMenuMovedAnimated(_ move: CGFloat) {
        let ratio: CGFloat = move/SCREEN_WIDTH
        
        //菜单字体颜色更新
        let nowMenu = self.viewWithTag(Int(1000+ratio)) as! UIButton?
        
        //颜色赋值顺序不可变: 先更新标记的, 再更新当前的
        lastMenu?.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
        nowMenu?.setTitleColor(redColor, for: UIControlState.normal)
        
        //将当前 标记
        lastMenu = nowMenu
    }
    
    func scrollMenuMovingAnimated(_ move: CGFloat) {
        let ratio: CGFloat = move/SCREEN_WIDTH
        let moveWidth = ratio*((bottomLine?.width)!+10*2)
        
        //线移动
        bottomLine?.transform = CATransform3DGetAffineTransform(CATransform3DMakeTranslation(moveWidth, 0, 0))
    }
    
    func clickMenuMovingAnimated(_ index: Int) {
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomLine?.transform = CGAffineTransform.init(translationX: (self.lastMenu?.width)!*CGFloat(index), y: 0)
        })
    }
    
    func getLastMenuButton(_ index: Int) {
        lastMenu?.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
        
        lastMenu = self.viewWithTag(1000+index) as! UIButton?
        lastMenu?.setTitleColor(redColor, for: UIControlState.normal)
        
        bottomLine?.transform = CGAffineTransform.init(translationX: (lastMenu?.width)!*CGFloat(index), y: 0)
    }
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------

}
