//
//  NBHomeTitleCell.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/10.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NBHomeTitleCell: UITableViewCell {
    
    var typeLabel: UILabel?
    var line1: UIView?
    var line2: UIView?
    var otherLabel: UILabel?
    let CELLWIDTH = 200 * RATIO_WIDTH

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LayoutViews
    func layoutViews() {
        let labelH = 35.0 * RATIO_WIDTH
        typeLabel = UILabel.init(frame: CGRect.init(x: 5 * RATIO_WIDTH, y: (self.height - labelH) / 2, width: CELLWIDTH - 10 * RATIO_WIDTH, height: labelH))
        typeLabel?.text = ""
        typeLabel?.textColor = whiteColor
        typeLabel?.textAlignment = NSTextAlignment.left
        typeLabel?.layer.cornerRadius = 4
        typeLabel?.clipsToBounds = true
//        typeLabel.
        typeLabel?.font = FONT_15
        
        line1 = UIView.init(frame: CGRect.init(x: 5 * RATIO_WIDTH, y: self.height / 2 - 0.5, width: 10 * RATIO_WIDTH, height: 1))
        line1?.backgroundColor = RGB(80, 80, 80)
        
        otherLabel = UILabel.init(frame: CGRect.init(x: (line1?.maxX)! + 2 * RATIO_WIDTH, y: (self.height - 20 * RATIO_WIDTH) / 2, width: 70 * RATIO_WIDTH, height: 20 * RATIO_WIDTH))
        otherLabel?.text = "我的分组"
        otherLabel?.textAlignment = NSTextAlignment.center
        otherLabel?.textColor = RGB(80, 80, 80)
        otherLabel?.font = FONT_12
        
        line2 = UIView.init(frame: CGRect.init(x: (otherLabel?.maxX)! + 2 * RATIO_WIDTH, y: self.height / 2 - 0.5, width: CELLWIDTH - (otherLabel?.maxX)! - 5 * RATIO_WIDTH, height: 1))
        line2?.backgroundColor = RGB(80, 80, 80)
        
        self.contentView.addSubview(typeLabel!)
//        self.contentView.addSubview(line1!)
//        self.contentView.addSubview(otherLabel!)
//        self.contentView.addSubview(line2!)
    }
    
    func setDataWithModel(indexPath: NSIndexPath, cellTitle: String) {
        line1?.isHidden = false
        line2?.isHidden = false
        if indexPath.row == 0 {
            self.typeLabel?.text = "首页"
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 1 {
            self.typeLabel?.text = "好友圈"
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
//            self.typeLabel?.textColor = whiteColor
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 2 {
//            self.typeLabel?.textColor = whiteColor
            self.typeLabel?.text = "群微博"
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 3 {
            self.otherLabel?.text = "我的分组"
            self.otherLabel?.textColor = RGB(40, 40, 40)
            self.otherLabel?.font = FONT_16
            self.contentView.addSubview(line1!)
            
            self.contentView.addSubview(otherLabel!)
            self.contentView.addSubview(line2!)
        } else if indexPath.row == 4 {
//            self.typeLabel?.textColor = whiteColor
            self.typeLabel?.text = "qqq"
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 5 {
            self.typeLabel?.text = "www"
//            self.typeLabel?.textColor = whiteColor
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 6 {
//            self.typeLabel?.textColor = whiteColor
            self.typeLabel?.text = "悄悄关注"
            if cellTitle == self.typeLabel?.text {
                self.typeLabel?.textColor = RGB(235, 175, 36)
                self.typeLabel?.backgroundColor = RGB(120, 120, 120)
            } else {
                self.typeLabel?.textColor = whiteColor
            }
            self.typeLabel?.font = FONT_20
        } else if indexPath.row == 7 {
            self.otherLabel?.text = "其他"
            self.otherLabel?.textColor = RGB(40, 40, 40)
            self.otherLabel?.font = FONT_16
            self.contentView.addSubview(line1!)
            self.contentView.addSubview(otherLabel!)
            self.contentView.addSubview(line2!)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
