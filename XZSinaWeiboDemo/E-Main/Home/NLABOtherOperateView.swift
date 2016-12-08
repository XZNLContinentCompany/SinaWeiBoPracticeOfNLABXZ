//
//  NLABOtherOperateView.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABOtherOperateView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Layout
    func layoutViews() {
        let transMissionBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: self.width / 3, height: self.height))
        transMissionBtn.backgroundColor = clearColor
        transMissionBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        transMissionBtn.setTitle("转发", for: UIControlState.normal)
        transMissionBtn.setTitleColor(RGB(130, 130, 130), for: UIControlState.normal)
        transMissionBtn.titleLabel?.font = FONT_13
        transMissionBtn.addTarget(self, action: #selector(clickTransmissionBtn), for: UIControlEvents.touchUpInside)
        
        // MARK: FirstSeperateLine
        let seperateLineH = self.height / 2
        let seperateLine1 = UIView.init(frame: CGRect.init(x: self.width / 3, y: (self.height - seperateLineH) / 2, width: 0.5, height: seperateLineH))
        seperateLine1.backgroundColor = RGB(240, 240, 240)
        
        
        let commentBtn = UIButton.init(frame: CGRect.init(x: self.width / 3, y: 0, width: self.width / 3, height: self.height))
        commentBtn.backgroundColor = clearColor
        commentBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        commentBtn.setTitle("评论", for: UIControlState.normal)
        commentBtn.setTitleColor(RGB(130, 130, 130), for: UIControlState.normal)
        commentBtn.titleLabel?.font = FONT_13
        commentBtn.addTarget(self, action: #selector(clickCommentBtn), for: UIControlEvents.touchUpInside)
        
        let seperateLine2 = UIView.init(frame: CGRect.init(x: self.width * 2 / 3, y: (self.height - seperateLineH) / 2, width: 0.5, height: seperateLineH))
        seperateLine2.backgroundColor = RGB(240, 240, 240)
        
        let sendGoodBtn = UIButton.init(frame: CGRect.init(x: self.width * 2 / 3 , y: 0, width: self.width / 3, height: self.height))
        sendGoodBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        sendGoodBtn.setTitle("0", for: UIControlState.normal)
        sendGoodBtn.setTitleColor(RGB(130, 130, 130), for: UIControlState.normal)
        sendGoodBtn.titleLabel?.font = FONT_13
        sendGoodBtn.backgroundColor = clearColor
        sendGoodBtn.addTarget(self, action: #selector(clickSendGoodBtn), for: UIControlEvents.touchUpInside)
        
        self.addSubview(transMissionBtn)
        self.addSubview(seperateLine1)
        self.addSubview(commentBtn)
        self.addSubview(seperateLine2)
        self.addSubview(sendGoodBtn)
        
    }
    
    
    // MARK: Action
    // MARK: ClickBtnAction
    func clickTransmissionBtn() {
        XXZLog("clicktrans")
    }
    
    func clickCommentBtn() {
        XXZLog("clickComment")
    }
    
    func clickSendGoodBtn() {
        XXZLog("click sendGood")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
