//
//  NLABOtherView.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

protocol clickOtherTableViewCellDelegate {
    func clickOtherTableCell(_ indexPath: NSIndexPath)
}

class NLABOtherView: UIView,UITableViewDelegate,UITableViewDataSource {
    
    var otherTableView: UITableView?
    var otherTableDelegate: clickOtherTableViewCellDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        buildSubView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LayoutSubView
    func buildSubView() {
        buildOtherView()
        buildSubViews()
    }
    
    // MARK: buildOtherView
    func buildOtherView() {
//        self.backgroundColor = RGB(96, 96, 96)
    }
    
    // MARK: buildSubViews
    func buildSubViews() {
        let otherTableViewH = 150 * RATIO_WIDTH
        let otherTableViewW = 200 * RATIO_WIDTH
        otherTableView = UITableView.init(frame: CGRect.init(x: SCREEN_WIDTH - 10 * RATIO_WIDTH - otherTableViewW, y: 64, width: otherTableViewW, height: otherTableViewH), style: UITableViewStyle.plain)
//        otherTableView = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: self.height), style: UITableViewStyle.plain)
        otherTableView?.backgroundColor = RGB(96, 96, 96)
        otherTableView?.delegate = self
        otherTableView?.dataSource = self
        otherTableView?.separatorColor = RGB(80, 80, 80)
        self.addSubview(otherTableView!)
    }
    
    // MARK: ----- delegate && dataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = NLABOtherTableCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        (cell as! NLABOtherTableCell).setDataWithModel(indexPath as NSIndexPath)
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let delegate = otherTableDelegate {
            self.removeFromSuperview()
            delegate.clickOtherTableCell(indexPath as NSIndexPath)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * RATIO_WIDTH
    }
    
    // MARK: Method
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.removeFromSuperview()
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
