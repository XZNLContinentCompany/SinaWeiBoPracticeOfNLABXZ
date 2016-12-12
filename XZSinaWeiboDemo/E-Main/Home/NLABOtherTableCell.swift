//
//  NLABOtherTableCell.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABOtherTableCell: UITableViewCell {
    
    var backView: UIView?
    var iag: UIImageView?
    var titleLabel: UILabel?
//    let CELLWIDTH = 200 * RATIO_WIDTH
//    let CELLHEIGHT = 50 * RATIO_WIDTH
    
    // MARK: lazyLoading
    lazy var backViewLoad: UIView = {
        let H = 40.0 * RATIO_WIDTH
       let backView = UIView.init(frame: CGRect.init(x: 5 * RATIO_WIDTH, y: (50 * RATIO_WIDTH - H) / 2, width: self.width - 10 * RATIO_WIDTH, height: H))
//        backView.backgroundColor = whiteColor
        return backView
    }()
    
    lazy var headIag: UIImageView = {
        let iagH = 20 * RATIO_WIDTH
       let iag = UIImageView.init(frame: CGRect.init(x: 5 * RATIO_WIDTH, y: ((self.backView?.height)! - iagH) / 2, width: iagH, height: iagH))
        iag.backgroundColor = cyanColor
        return iag
    }()
    
    lazy var titleL: UILabel = {
        let labelW = 100 * RATIO_WIDTH
        let labelH = 20 * RATIO_WIDTH
       let titleLabel = UILabel.init(frame: CGRect.init(x: (self.iag?.maxX)! + 5 * RATIO_WIDTH, y: ((self.backView?.height)! - labelH) / 2, width: labelW, height: labelH))
//        titleLabel.text = ""
        return titleLabel
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: buildLayout
    func buildLayout() {
        self.backgroundColor = clearColor
        self.backView = backViewLoad
        self.iag = headIag
        self.titleLabel = titleL
        self.contentView.addSubview(self.backView!)
        self.contentView.addSubview(self.iag!)
        self.contentView.addSubview(self.titleLabel!)
    }
    
    func setDataWithModel(_ indexPath: NSIndexPath) {
        if indexPath.row == 0 {
            self.titleLabel?.text = "雷达"
        } else if indexPath.row == 1 {
            self.titleLabel?.text = "扫一扫"
        } else if indexPath.row == 2 {
            self.titleLabel?.text = "打车"
        }
    }

}
