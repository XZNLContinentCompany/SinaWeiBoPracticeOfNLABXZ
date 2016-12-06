//
//  SubTableView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class SubTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    fileprivate var subTable: UITableView?
    
    var cellIdentifier: String = "DefaultSubTableCellIdentifier"
    var subDataArr: [Any]
    
    init(_ frame: CGRect, _ identifier: String, _ dataSource: [Any]) {
        self.cellIdentifier = identifier
        self.subDataArr = dataSource
        
        super.init(frame: frame)
        
//        self.isUserInteractionEnabled = false
        buildLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: ------ UITableViewDataSource ------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if subDataArr.count != 0 {
            return subDataArr.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = cellIdentifier
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell==nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.textLabel?.font = FONT_12
        }
        //conding...
        if subDataArr.count != 0 {
            cell?.textLabel?.text = String(describing: subDataArr[indexPath.section])
        }
        
        return cell!
    }
    
    //MARK: ------ UITableViewDelegate ------
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init()
//        headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: <#30*RATIO_WIDTH#>)
//        headerView.backgroundColor = LINE_COLOR
//        
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView.init()
//        footerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: <#30*RATIO_WIDTH#>)
//        footerView.backgroundColor = LINE_COLOR
//        
//        return footerView
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 5.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0*RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        XXZLog(indexPath.section)
    }
    
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadSubTableView()
    }
    
    //MARK: ------ loading ------
    func loadSubTableView() {
        subTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: self.height), style: UITableViewStyle.grouped)
        subTable?.delegate = self
        subTable?.dataSource = self
        subTable?.separatorStyle = UITableViewCellSeparatorStyle.none
        subTable?.isScrollEnabled = false
        subTable?.backgroundColor = BACK_COLOR
        self.addSubview(subTable!)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
