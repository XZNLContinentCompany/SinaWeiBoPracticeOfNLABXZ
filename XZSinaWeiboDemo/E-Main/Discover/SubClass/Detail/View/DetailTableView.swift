//
//  DetailTableView.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

protocol DetailTableViewDelegate {
    func detailTableView(_ indexPath: IndexPath)
}

class DetailTableView: UIView, UITableViewDelegate, UITableViewDataSource {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var detailArr: [Any]?
    var detailTable: UITableView?
    
    var delegate: DetailTableViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
        if let value = detailArr {
            return value.count
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "DiscoverDetailCellIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell==nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            cell?.textLabel?.font = FONT_12
        }
        //conding...
        if let value = detailArr {
            let content = String.init(describing: value[indexPath.section])
            cell?.textLabel?.text = content
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
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44.0*RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        XXZLog(indexPath.section)
        
        if let delegate = delegate {
            delegate.detailTableView(indexPath)
        }
    }
    
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadDetailTableView()
    }
    
    //MARK: ------ loading ------
    func loadDetailTableView() {
        detailTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: self.width, height: self.height), style: UITableViewStyle.grouped)
        detailTable?.delegate = self
        detailTable?.dataSource = self
        detailTable?.backgroundColor = clearColor
        self.addSubview(detailTable!)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
}
