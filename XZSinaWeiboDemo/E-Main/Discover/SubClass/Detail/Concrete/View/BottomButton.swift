//
//  BottomButton.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class BottomButton: UIButton, CAAnimationDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var mark: UILabel?
    var img: UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        mark?.sizeToFit()
        
        let img_height: CGFloat = 20
        let distance_x:CGFloat = (self.width-(img_height+5+(mark?.width)!))/2
        
        img?.frame = CGRect.init(x: distance_x, y: (self.height-img_height)/2, width: 20, height: 20)
        mark?.frame = CGRect.init(x: (img?.maxX)!+5, y: (self.height-(mark?.height)!)/2, width: (mark?.width)!, height: (mark?.height)!)
        
    }
    
    //MARK: ------ CAAnimationDelegate ------
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        isStopAnimation = true
    }
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadImgView()
    }
    
    //MARK: ------ loading ------
    func loadImgView() {
        img = UIImageView.init()
        img?.backgroundColor = cyanColor
        img?.contentMode = UIViewContentMode.center
        self.addSubview(img!)
        
        mark = UILabel.init()
        mark?.font = FONT_12
        mark?.textColor = UICOLOR_LIGHT
        mark?.textAlignment = NSTextAlignment.center
//        mark?.backgroundColor = cyanColor
        self.addSubview(mark!)
        
        let verLine = UIView.init(frame: CGRect.init(x: self.width-0.5, y: 10, width: 0.5, height: self.height-10*2))
        verLine.backgroundColor = LINE_COLOR
        self.addSubview(verLine)
    }
    
    var isStopAnimation: Bool = true
    func favourAnimated(_ show: inout Bool) {
        if !isStopAnimation {
//            XXZLog("动画还没结束")
            show = !show
            return
        }
        
        isStopAnimation = false
        
        if show {
            img?.backgroundColor = redColor
        }
        else {
            img?.backgroundColor = cyanColor
        }
        
//        self.img?.transform = CGAffineTransform.init(scaleX: 1.0, y: 1.0)
//        UIView.animate(withDuration: 0.5, animations: {
//            self.img?.transform = CGAffineTransform.init(scaleX: 0.6, y: 0.6)
//        })
        
        let keyFrameAnimation = CAKeyframeAnimation.init(keyPath: "transform.scale")
        keyFrameAnimation.delegate = self
        
        let value1 = NSValue.init(cgPoint: CGPoint.init(x: 1.0, y: 1.0))
        let value2 = NSValue.init(cgPoint: CGPoint.init(x: 2.0, y: 2.0))
        let value3 = NSValue.init(cgPoint: CGPoint.init(x: 0.5, y: 0.5))
        let value4 = NSValue.init(cgPoint: CGPoint.init(x: 1.0, y: 1.0))
        keyFrameAnimation.values = [value1, value2, value3, value4]
        
//        let timeFunc = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionEaseInEaseOut)
//        keyFrameAnimation.timingFunctions = []
        keyFrameAnimation.calculationMode = kCAAnimationPaced
        keyFrameAnimation.duration = 0.5
        
        img?.layer .add(keyFrameAnimation, forKey: nil)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
