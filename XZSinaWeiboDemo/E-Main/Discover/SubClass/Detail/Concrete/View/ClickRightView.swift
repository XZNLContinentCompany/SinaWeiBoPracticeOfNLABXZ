//
//  ClickRightView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class ClickRightView: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    //MARK: ------ constant & variable ------
    var bottomMaskView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = blackColor.withAlphaComponent(0.0)
        self.isHidden = true
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    func tapAction() {
        hiddenAnimated()
    }
    
    func cancelAction() {
        hiddenAnimated()
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadBottomMaskView()
    }
    
    //MARK: ------ loading ------
    func loadBottomMaskView() {
        let topView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: self.height/2))
        self.addSubview(topView)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(tapAction))
        topView.addGestureRecognizer(tap)
        
        bottomMaskView = UIView.init(frame: CGRect.init(x: 0, y: self.height/2, width: self.width, height: self.height/2))
        bottomMaskView?.backgroundColor = whiteColor.withAlphaComponent(0.7)
        self.addSubview(bottomMaskView!)
        
        loadBottomButton()
    }
    
    func loadBottomButton() {
        let bottomButton = UIButton.init(type: UIButtonType.custom)
        bottomButton.frame = CGRect.init(x: 0, y: (bottomMaskView?.height)!-40, width: (bottomMaskView?.width)!, height: 40)
        bottomButton.titleLabel?.font = FONT_14
        bottomButton.backgroundColor = whiteColor
        bottomButton.setTitle("取消", for: UIControlState.normal)
        bottomButton.setTitleColor(UICOLOR_DARK, for: UIControlState.normal)
        bottomMaskView?.addSubview(bottomButton)
        
        bottomButton.addTarget(self, action: #selector(cancelAction), for: UIControlEvents.touchUpInside)
    }
    
    //MARK: ------ method ------
    func showAnimated() {
        self.isHidden = false
        bottomMaskView?.transform = CGAffineTransform.init(translationX: 0, y: (bottomMaskView?.height)!)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomMaskView?.transform = CGAffineTransform.identity
            self.backgroundColor = blackColor.withAlphaComponent(0.5)
        })
    }
    
    func hiddenAnimated() {
        UIView.animate(withDuration: 0.3, animations: {
            self.bottomMaskView?.transform = CGAffineTransform.init(translationX: 0, y: (self.bottomMaskView?.height)!)
            self.backgroundColor = blackColor.withAlphaComponent(0.0)
        }, completion: { (finshed) in
            self.isHidden = true
        })
    }
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
