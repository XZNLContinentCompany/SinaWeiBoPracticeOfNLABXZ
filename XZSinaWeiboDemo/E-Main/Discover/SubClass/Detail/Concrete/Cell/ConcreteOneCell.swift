//
//  ConcreteOneCell.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class ConcreteOneCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //MARK: ------ constant & variable ------
    var scrollView: UIScrollView?
    var count: Int = 0
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func concreteOneCell(_ indexPath: IndexPath, _ height: CGFloat,_ info: [Dictionary<String, String>]) {
        if info.count != 0 {
            count = info.count
            
            var rect = scrollView?.frame
            rect?.size.height = height-30*RATIO_WIDTH
            scrollView?.frame = rect!
            scrollView?.contentSize = CGSize.init(width: CGFloat(count)*(scrollView?.width)!, height: (scrollView?.height)!)
            
            createSubView(&count)
            
            for i in 0..<count {
                let subView = scrollView?.viewWithTag(1000+i)
//                let img = subView?.viewWithTag(2000+i) as! UIImageView?
                let title = subView?.viewWithTag(3000+i) as! UILabel?
                let from = subView?.viewWithTag(4000+i) as! UILabel?
                
                if let value = info[i]["title"] {
                    title?.text = value
                }
                
                if let value = info[i]["from"] {
                    from?.text = "from: \(value)"
                }
            }
        }
        else {
            XXZLog("没有数据")
        }
    }
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadMarkView()
        loadScrollView()
    }
    
    //MARK: ------ loading ------
    func createSubView(_ count: inout Int) {
        if count<=0 {
            count = 1
        }
        
        let width = (scrollView?.width)!
        let height = (scrollView?.height)!
        for i in 0..<count {
            let subView = UIView.init(frame: CGRect.init(x: CGFloat(i)*width, y: 0, width: width-1, height: height))
//            subView.backgroundColor = RGB(CGFloat(i+10), CGFloat(i*10+50), CGFloat(i*100+20))
            scrollView?.addSubview(subView)
            subView.tag = 1000+i
            
            let img_height = height-10*2
            let img = UIImageView.init(frame: CGRect.init(x: 10, y: 10, width: img_height, height: img_height))
            img.backgroundColor = cyanColor
            img.contentMode = UIViewContentMode.center
            img.tag = 2000+i
            subView.addSubview(img)
            
            let title = UILabel.init(frame: CGRect.init(x: img.maxX+10, y: img.minY, width: width-(img.maxX+10+10), height: img.height-21))
            title.font = FONT_16
            title.textColor = UICOLOR_DARK
//            title.backgroundColor = cyanColor
            title.numberOfLines = 2
            title.tag = 3000+i
            title.text = "title"
            subView.addSubview(title)
            
            let from = UILabel.init(frame: CGRect.init(x: title.minX, y: title.maxY+1, width: title.width, height: 20))
            from.font = FONT_10
            from.textColor = UICOLOR_LIGHT
//            from.backgroundColor = cyanColor
            from.tag = 4000+i
            from.text = "from"
            subView.addSubview(from)
        }
    }
    
    func loadScrollView() {
        scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 30*RATIO_WIDTH, width: SCREEN_WIDTH, height: self.contentView.height-30*RATIO_WIDTH))
        scrollView?.isPagingEnabled = true
        scrollView?.backgroundColor = whiteColor
        self.contentView.addSubview(scrollView!)
        
        scrollView?.bounces = true
        scrollView?.contentSize = CGSize.init(width: SCREEN_WIDTH*4, height: 0)
    }
    
    func loadMarkView() {
        let mark = UILabel.init(frame: CGRect.init(x: 15*RATIO_WIDTH, y: 0, width: SCREEN_WIDTH-15*RATIO_WIDTH*2, height: 30*RATIO_WIDTH))
        mark.text = "相关推荐"
        mark.textColor = UICOLOR_LIGHT
        mark.font = FONT_12
//        mark.backgroundColor = cyanColor
        self.contentView.addSubview(mark)
        
        let horiLine = UIView.init(frame: CGRect.init(x: 0, y: mark.maxY-0.5, width: SCREEN_WIDTH, height: 0.5))
        horiLine.backgroundColor = LINE_COLOR
        self.contentView.addSubview(horiLine)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
