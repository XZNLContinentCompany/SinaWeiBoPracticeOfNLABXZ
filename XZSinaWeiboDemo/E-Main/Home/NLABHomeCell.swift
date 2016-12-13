//
//  NLABHomeCell.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABHomeCell: UITableViewCell {
    var headIag: UIImageView?
    var rankIag: UIImageView?
    var nickLabel: UILabel?
    var timeAndOrigin: UILabel?
    var rankIcon: UIImageView?
    var moreBtn: UIButton?
    var WBTextLabel: UILabel?
    var otherWBContentBtn: UIButton?
    var seperateLine1: UIView?
    var otherOperateView: NLABOtherOperateView?
    var cellSeperateLine: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        //        super.init(coder: aDecoder)
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutOfCellSubView()
    }
    
    // MARK: LayOut
    func layoutOfCellSubView() {
        let headIagH = 60 * RATIO_WIDTH
        headIag = UIImageView.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: 10 * RATIO_WIDTH, width: headIagH, height: headIagH))
        headIag?.layer.cornerRadius = headIagH / 2
        headIag?.clipsToBounds = true
        headIag?.backgroundColor = greenColor
        headIag?.image = UIImage.init(named: "")
        
        let rankIagH = 15 * RATIO_WIDTH
        rankIag = UIImageView.init(frame: CGRect.init(x: headIagH - rankIagH, y: headIagH - rankIagH, width: rankIagH, height: rankIagH))
        rankIag?.backgroundColor = blackColor
        rankIag?.image = UIImage.init(named: "")
        
        nickLabel = UILabel.init(frame: CGRect.init(x: headIag!.maxX + 20 * RATIO_WIDTH, y: (headIagH - 20 * RATIO_WIDTH * 2 - 5 * RATIO_WIDTH) / 2 + headIag!.y, width: 70 * RATIO_WIDTH, height: 20 * RATIO_WIDTH))
        nickLabel?.text = "网易云音乐"
        nickLabel?.textColor = RGB(40.0, 40.0, 40.0)
        nickLabel?.font = FONT_14
        nickLabel?.textAlignment = NSTextAlignment.left
        
        rankIcon = UIImageView.init(frame: CGRect.init(x: nickLabel!.maxX + 10 * RATIO_WIDTH, y: nickLabel!.y, width: 15 * RATIO_WIDTH, height: 15 * RATIO_WIDTH))
        rankIcon?.backgroundColor = blueColor
        rankIcon?.image = UIImage.init(named: "")
        
        timeAndOrigin = UILabel.init(frame: CGRect.init(x: nickLabel!.x, y: nickLabel!.maxY + 5 * RATIO_WIDTH, width: 100 * RATIO_WIDTH, height: 20 * RATIO_WIDTH))
        timeAndOrigin?.textAlignment = NSTextAlignment.left
        timeAndOrigin?.textColor = RGB(130.0, 130.0, 130.0)
        timeAndOrigin?.text = "1分钟 来自微博 weibo.com"
        timeAndOrigin?.font = FONT_12
        
        let moreBtnH = 20 * RATIO_WIDTH
        moreBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - moreBtnH - 10 * RATIO_WIDTH), y: 10 * RATIO_WIDTH, width: moreBtnH, height: moreBtnH))
        moreBtn?.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        moreBtn?.addTarget(self, action: #selector(clickMoreBtn), for: UIControlEvents.touchUpInside)
        moreBtn?.backgroundColor = blackColor
        
        WBTextLabel = UILabel.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: self.headIag!.maxY + 5 * RATIO_WIDTH, width: SCREEN_WIDTH - 20 * RATIO_WIDTH, height: 100 * RATIO_WIDTH))
        WBTextLabel?.text = "#抢票活动##张杰2016我想巡回演唱会#合肥站来了！12月10日@张杰将来到合肥滨湖国际会展中心主展馆带来精彩演出！每一首耳熟能详的金曲，倾诉幸福，感怀哀伤，励志人生。你会从他的音乐里找到属于自己的感动。登录网易云音乐参与活动就有机会获得演出门票！戳>>"
        WBTextLabel?.textColor = RGB(40, 40, 40)
        WBTextLabel?.textAlignment = NSTextAlignment.left
        WBTextLabel?.font = FONT_15
        WBTextLabel?.numberOfLines = 0
        
        seperateLine1 = UIView.init(frame: CGRect.init(x: 0, y: WBTextLabel!.maxY + 5 * RATIO_WIDTH, width: SCREEN_WIDTH, height: 0.5))
        seperateLine1?.backgroundColor = RGB(240, 240, 240)
        
        otherOperateView = NLABOtherOperateView.init(frame: CGRect.init(x: 0, y: seperateLine1!.maxY, width: SCREEN_WIDTH, height: 40 * RATIO_WIDTH))
        otherOperateView?.backgroundColor = whiteColor
        
        cellSeperateLine = UIView.init(frame: CGRect.init(x: 0, y: otherOperateView!.maxY + 1, width: SCREEN_WIDTH, height: 10 * RATIO_WIDTH))
        cellSeperateLine?.backgroundColor = RGB(240, 240, 240)
        
        
        self.contentView.addSubview(headIag!)
        headIag?.addSubview(rankIag!)
        self.contentView.addSubview(nickLabel!)
        self.contentView.addSubview(timeAndOrigin!)
        self.contentView.addSubview(moreBtn!)
        self.contentView.addSubview(WBTextLabel!)
        self.contentView.addSubview(seperateLine1!)
        self.contentView.addSubview(otherOperateView!)
        self.contentView.addSubview(cellSeperateLine!)
        
        //        self.contentView.addSubview(headIag)
        
    }
    
    public func cellHeight() -> CGFloat {
        return self.cellSeperateLine!.maxY
    }
    
    // MARK: Action
    // MARK: ClickBtnAction
    func clickMoreBtn() -> Void {
        let alertBtn = NBAlertBtn.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        UIApplication.shared.keyWindow?.addSubview(alertBtn)
        
        alertBtn.showAnimated()
    }
}
