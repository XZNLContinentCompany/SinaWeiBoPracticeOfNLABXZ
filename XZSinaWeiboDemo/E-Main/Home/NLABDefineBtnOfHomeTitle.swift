//
//  NLABDefineBtnOfHomeTitle.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABDefineBtnOfHomeTitle: UIButton {
    
    var btnLabel: UILabel?
    var btnIagView: UIImageView?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(frame: CGRect, text: String, image: String) {
        super.init(frame: frame)
        buildLayout(text: text, image: image)
    }
    
    // MARK: BuildLayout
    func buildLayout(text: String, image: String) {
        buildBtnLabel(text: text)
    }
    
    // MARK: defineOfMyLabel
    func buildBtnLabel(text: String) {
//        let btnLabel = UILabel.init(frame: CGRect.init(x: 0, y: (self.height - 20 * RATIO_WIDTH) / 2, width: self.width * 2 / 3 , height: 20 * RATIO_WIDTH)
        btnLabel = UILabel.init(frame: CGRect.init(x: 0, y: (self.height - 20 * RATIO_WIDTH) / 2, width: self.width * 2 / 3, height: 20 * RATIO_WIDTH))
        btnLabel?.text = text
        btnLabel?.textColor = blackColor
        btnLabel?.textAlignment = NSTextAlignment.center
        btnLabel?.font = FONT_12
        self.addSubview(btnLabel!)
    }
    
    func buildBtnImage(image: String) {
        btnIagView = UIImageView.init(frame: CGRect.init(x: self.width * 2 / 3, y: (self.height - 40 * RATIO_WIDTH) / 2, width: self.width / 3, height: 40 * RATIO_WIDTH))
        btnIagView?.image = UIImage.init(named: image)
        self.addSubview(btnIagView!)
    }
   
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
