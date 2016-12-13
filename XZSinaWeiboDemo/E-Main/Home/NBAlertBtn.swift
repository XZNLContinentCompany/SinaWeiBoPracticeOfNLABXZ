//
//  NBAlertBtn.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/13.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NBAlertBtn: UIButton,UITableViewDelegate,UITableViewDataSource {
    var titleArr: Array<Any>?
    var sectionTwo: Array<Any>?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.isHidden = false
        self.backgroundColor = blackColor.withAlphaComponent(0.0)
        
        buildSubViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: buildSubViews
    func buildSubViews() {
        titleArr = ["收藏", "帮上头条", "取消关注", "屏蔽", "举报"]
        sectionTwo = ["取消"]
        
        buildViews()
    }
    
    func buildViews() {
//        let alertTableView = UITableView.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT - 50 * RATIO_WIDTH * 6, width: SCREEN_WIDTH, height: 50 * RATIO_WIDTH * 6))
        let alertTableView = UITableView.init()
        alertTableView.frame = CGRect.init(x: 0, y: SCREEN_HEIGHT - 50 * RATIO_WIDTH * 6, width: SCREEN_WIDTH, height: 50 * RATIO_WIDTH * 6)
        alertTableView.delegate = self
        alertTableView.dataSource = self
        alertTableView.tag = 1001
        alertTableView.separatorColor = RGB(240, 240, 240)
        alertTableView.isScrollEnabled = false
        
        self.addSubview(alertTableView)
    }
    
    // MARK: Delegate && DataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            if let value = titleArr?.count {
                return value
            }
        }
        else if section == 1{
            if let value = sectionTwo?.count {
                return value
            }
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
            
            let labelH = 50 * RATIO_WIDTH
            let labelW = 200 * RATIO_WIDTH
            let title = UILabel.init(frame: CGRect.init(x: (SCREEN_WIDTH - labelW) / 2, y: 0, width: labelW, height: labelH))
            title.textColor = blackColor
            title.font = FONT_15
            title.tag = 1000;
            title.textAlignment = NSTextAlignment.center
            cell?.contentView.addSubview(title)
            
        }
        
        let title = cell?.contentView.viewWithTag(1000) as! UILabel?
        
        if indexPath.section == 0 {
//                cell?.textLabel?.text = titleArr?[indexPath.row] as! String?
//                cell?.textLabel?.textAlignment = NSTextAlignment.center
            
            if let value = titleArr?[indexPath.row]  {
                title?.text = "\(value)"
            }
            else {
                XXZLog("没值")
            }
            
        } else if indexPath.section == 1 {
//            cell?.textLabel?.text = "取消"
//            cell?.textLabel?.textAlignment = NSTextAlignment.center
            
            title?.text = "取消"
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50 * RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 1 {
            return 5 * RATIO_WIDTH
        } else {
            return 0.001
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1{
            let header = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 5 * RATIO_WIDTH))
            header.backgroundColor = RGB(240, 240, 240)
            return header
        } else {
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            hiddenAnimated()
        }
    }
    
    //MARK: ------ Method ------
    // MARK: 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        hiddenAnimated()
    }
    
    func showAnimated() {
        self.isHidden = false
        let tableView = self.viewWithTag(1001) as! UITableView?
        tableView?.transform = CGAffineTransform.init(translationX: 0, y: 50 * RATIO_WIDTH * 6)
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.backgroundColor = blackColor.withAlphaComponent(0.5)
            tableView?.transform = CGAffineTransform.identity
            
        })
    }
    
    func hiddenAnimated() {
        let tableView = self.viewWithTag(1001) as! UITableView?
        
        UIView.animate(withDuration: 0.3, animations: {
            
            self.backgroundColor = blackColor.withAlphaComponent(0.0)
            tableView?.transform = CGAffineTransform.init(translationX: 0, y: 50 * RATIO_WIDTH * 6)
            
        }, completion: { (finished) in
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
