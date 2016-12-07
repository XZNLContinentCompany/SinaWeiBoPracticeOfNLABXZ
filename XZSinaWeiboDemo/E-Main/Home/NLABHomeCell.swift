//
//  NLABHomeCell.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABHomeCell: UITableViewCell {
//    var headIag: UIImageView
//    var rankIag: UIImageView
//    var nickLabel: UILabel
//    var timeAndOrigin: UILabel
//    var rankIcon: UIImageView
//    var moreBtn: UIButton
//    var WBTextLabel: UILabel
//    var otherWBContentBtn: UIButton
//
//    // MARK: 懒加载
//    let headIag: UIImageView = {
//        let headIagH: CGFloat = 60.0 * RATIO_WIDTH
//        let headIag = UIImageView.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: 10 * RATIO_WIDTH, width: headIagH, height: headIagH))
//        headIag.image = UIImage.init(named: "")
//    }

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(_ frame: CGRect,_ style: UITableViewCellStyle,_ reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutOfCellSubView()
    }
    
    // MARK: LayOut
    func layoutOfCellSubView() {
        let headIagH = 60 * RATIO_WIDTH
        let headIag = UIImageView.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: 10 * RATIO_WIDTH, width: headIagH, height: headIagH))
        headIag.layer.cornerRadius = headIagH / 2
        headIag.clipsToBounds = true
        headIag.backgroundColor = greenColor
        headIag.image = UIImage.init(named: "")
        
        let rankIagH = 15 * RATIO_WIDTH
        let rankIag = UIImageView.init(frame: CGRect.init(x: headIagH - rankIagH, y: headIagH - rankIagH, width: rankIagH, height: rankIagH))
        rankIag.backgroundColor = blackColor
        rankIag.image = UIImage.init(named: "")
        
        let nickLabel = UILabel.init(frame: CGRect.init(x: headIag.maxX + 20 * RATIO_WIDTH, y: (headIagH - 20 * RATIO_WIDTH * 2 - 5 * RATIO_WIDTH) / 2, width: 70 * RATIO_WIDTH, height: 20 * RATIO_WIDTH))
        nickLabel.text = "网易云音乐"
        nickLabel.textColor = RGB(40.0, 40.0, 40.0)
        nickLabel.font = FONT_14
        nickLabel.textAlignment = NSTextAlignment.left
        
        let rankIcon = UIImageView.init(frame: CGRect.init(x: nickLabel.maxX + 10 * RATIO_WIDTH, y: nickLabel.y, width: 15 * RATIO_WIDTH, height: 15 * RATIO_WIDTH))
        rankIcon.backgroundColor = blueColor
        rankIcon.image = UIImage.init(named: "")
        
        let timeAndOrigin = UILabel.init(frame: CGRect.init(x: nickLabel.x, y: nickLabel.maxY + 5 * RATIO_WIDTH, width: 100 * RATIO_WIDTH, height: 20 * RATIO_WIDTH))
        timeAndOrigin.textAlignment = NSTextAlignment.left
        timeAndOrigin.textColor = RGB(140.0, 140.0, 140.0)
        timeAndOrigin.text = "1分钟 来自微博 weibo.com"
        timeAndOrigin.font = FONT_12
        
        let moreBtnH = 20 * RATIO_WIDTH
        let moreBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - moreBtnH - 10 * RATIO_WIDTH), y: 10 * RATIO_WIDTH, width: moreBtnH, height: moreBtnH))
        moreBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        moreBtn.addTarget(self, action: #selector(clickMoreBtn), for: UIControlEvents.touchUpInside)
        moreBtn.backgroundColor = blackColor
        
        
        self.contentView.addSubview(headIag)
        headIag.addSubview(rankIag)
        self.contentView.addSubview(nickLabel)
        self.contentView.addSubview(timeAndOrigin)
        self.contentView.addSubview(moreBtn)
//        self.contentView.addSubview(headIag)

        
        
    }
    
    
    // MARK: Action
    // MARK: ClickBtnAction
    func clickMoreBtn() -> Void {
        XXZLog("clickedMoreBtn")
    }
    
    
}








