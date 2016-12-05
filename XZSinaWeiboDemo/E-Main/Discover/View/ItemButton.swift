//
//  ItemButton.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/5.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class ItemButton: UIButton {

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
        
//        self.backgroundColor = clearColor
        
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
        let img_height = 40*RATIO_WIDTH
        let mark_height = 20*RATIO_WIDTH
        let distance_y: CGFloat = (self.height-(img_height+mark_height))/2
        let distance_x: CGFloat = (self.width-img_height)/2
        
        img = UIImageView.init(frame: CGRect.init(x: distance_x, y: distance_y, width: img_height, height: img_height))
        img?.backgroundColor = cyanColor
        img?.layer.cornerRadius = img_height/2
        img?.layer.masksToBounds = true
        self.addSubview(img!)
        
        mark = UILabel.init(frame: CGRect.init(x: 0, y: (img?.maxY)!+1, width: self.width, height: mark_height))
        mark?.backgroundColor = clearColor
        mark?.textAlignment = NSTextAlignment.center
        mark?.text = "mark"
        mark?.font = FONT_12
        mark?.textColor = UICOLOR_DARK
        self.addSubview(mark!)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
