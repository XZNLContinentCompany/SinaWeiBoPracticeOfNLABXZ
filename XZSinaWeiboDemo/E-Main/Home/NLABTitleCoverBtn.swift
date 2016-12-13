//
//  NLABTitleCoverBtn.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

protocol clickHomeTitleDelegate {
    func clickHomeTitle(_ indexPath: NSIndexPath,_ titleLabelText: String)
}

class NLABTitleCoverBtn: UIButton,UITableViewDelegate,UITableViewDataSource {
    
    var cell: NBHomeTitleCell?
    var editMyGroup: UIButton?
    var titleDelegate: clickHomeTitleDelegate?
    var cellTitle: String?
    var titleTableView: UITableView?
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    required init(frame: CGRect, cellTitle: String) {
        super.init(frame: frame)
        layoutViews()
        self.cellTitle = cellTitle
    }
    
    // MARK: layoutViews
    func layoutViews() {
        let tableViewH = 300 * RATIO_WIDTH
        let tableViewW = 200 * RATIO_WIDTH
        let tableView = UITableView.init(frame: CGRect.init(x: (SCREEN_WIDTH - tableViewW) / 2, y: 64, width: tableViewW, height: tableViewH))
        self.titleTableView = tableView
        tableView.delegate = self
        tableView.dataSource = self
//        tableView.backgroundColor = blackColor
        tableView.backgroundColor = RGB(96, 96, 96)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        self.addSubview(tableView)
        
        layoutEditBtn(tableView: tableView)
    }
    
    func layoutEditBtn(tableView: UITableView) -> Void {
        let editH = 30 * RATIO_WIDTH
        let editGroupBtn = UIButton.init(frame: CGRect.init(x: 5 * RATIO_WIDTH + tableView.x, y: tableView.height - 2 * RATIO_WIDTH - editH + tableView.y, width: tableView.width - 10 * RATIO_WIDTH, height: editH))
        editGroupBtn.layer.cornerRadius = 5
        editGroupBtn.clipsToBounds = true
        editGroupBtn.layer.borderColor = RGB(70, 70, 70).cgColor
        editGroupBtn.layer.borderWidth = 1
        editGroupBtn.setTitle("编辑我的分组", for: UIControlState.normal)
        editGroupBtn.setTitleColor(whiteColor, for: UIControlState.normal)
        editGroupBtn.addTarget(self, action: #selector(clickEditBtn(_:)), for: UIControlEvents.touchUpInside)
//        editGroupBtn.backgroundColor = redColor
        editGroupBtn.alpha = 1.0
        editGroupBtn.tag = 10000
        self.addSubview(editGroupBtn)
    }
    
    // MARK: Action
    // MARK: clickBtnAction
    func clickEditBtn(_ btn: UIButton) -> Void {
        XXZLog("clickEdit and it's tag = \(btn.tag)")
    }
    
    // MARK: UITableViewDatasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "CELLIDENTIFY"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = NBHomeTitleCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
//            cell?.backgroundColor = blackColor
            cell?.backgroundColor = clearColor
            self.cell = cell as! NBHomeTitleCell?
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
        }
        let tempCell = (cell as! NBHomeTitleCell)
        
        if tempCell.typeLabel?.text != nil {
            tempCell.typeLabel?.text = nil
            tempCell.typeLabel?.backgroundColor = clearColor
        }
        if tempCell.otherLabel?.text != nil {
            tempCell.otherLabel?.text = nil
        }
        if tempCell.line1 != nil {
            tempCell.line1?.isHidden = true
        }
        if tempCell.line2 != nil {
            tempCell.line2?.isHidden = true
        }
        
        tempCell.setDataWithModel(indexPath: indexPath as NSIndexPath, cellTitle: cellTitle!)
        return cell!
    }

    // MARK: UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 3 || indexPath.row == 7 {
            return
        }
        
        let cell =  tableView.cellForRow(at: indexPath)
        let tempCell = (cell as! NBHomeTitleCell)
        tempCell.typeLabel?.backgroundColor = RGB(120, 120, 120)
        tempCell.typeLabel?.textColor = RGB(235, 175, 36)
//        self.removeFromSuperview()
        hiddenAnimation()
    
        if let titleDelegate = titleDelegate {
            titleDelegate.clickHomeTitle(indexPath as NSIndexPath, (tempCell.typeLabel?.text)!)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        self.removeFromSuperview()
        hiddenAnimation()
    }
    
    //MARK: ------ publicFunction ------
    func showAnimation() {
//        let W = 200 * RATIO_WIDTH
        self.isHidden = false
        self.titleTableView?.transform = CGAffineTransform.init(translationX: 0, y: 0)
        UIView.animate(withDuration: 0.3, animations: {
//            self.backgroundColor = blackColor.withAlphaComponent(0.25)
            self.titleTableView?.transform = CGAffineTransform.identity
        })
    }
    
    func hiddenAnimation() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.titleTableView?.transform = CGAffineTransform.init(translationX: 0, y: 0)
        }, completion: { (finish) in
            self.isHidden = true
        })
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
