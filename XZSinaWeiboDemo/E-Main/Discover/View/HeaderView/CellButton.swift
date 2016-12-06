//
//  CellButton.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class CellButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    var img: UIImageView?
    var mark: UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadImgView()
    }
    
    //MARK: ------ loading ------
    func loadImgView() {
        let distance_y = 8*RATIO_WIDTH
        let distance_x = 10*RATIO_WIDTH
        let img_height = self.height-distance_y*2
        
        img = UIImageView.init(frame: CGRect.init(x: distance_x, y: distance_y, width: img_height, height: img_height))
        img?.layer.cornerRadius = 5.0
        img?.layer.masksToBounds = true
        img?.backgroundColor = cyanColor
        img?.contentMode = UIViewContentMode.center
        self.addSubview(img!)
        
        mark = UILabel.init(frame: CGRect.init(x: (img?.maxX)!+5, y: 0, width: self.width-(distance_x*2+img_height+5), height: self.height))
        mark?.backgroundColor = clearColor
        mark?.textAlignment = NSTextAlignment.left
        mark?.text = "mark"
        mark?.font = FONT_12
        mark?.textColor = UICOLOR_DARK
        self.addSubview(mark!)
        
//        let horiLine = UIView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: 0.5))
//        horiLine.backgroundColor = LINE_COLOR
//        self.addSubview(horiLine)
        
        let verLine = UIView.init(frame: CGRect.init(x: self.width-0.5, y: 5, width: 0.5, height: self.height-10))
        verLine.backgroundColor = LINE_COLOR
        self.addSubview(verLine)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
