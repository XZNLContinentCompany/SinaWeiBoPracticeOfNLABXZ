//
//  DiscoverDetailController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class DiscoverDetailController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ------ constant & variable ------
    var detailArr: [Any]?
    var detailTable: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BACK_COLOR
//        self.navigationItem.title = ""
        
        buildLayout()
        
        if let value = detailArr {
            XXZLog(value)
        }
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
        
    }
    
    
    //MARK: ------ action ------
    func leftAction() {
        let _ = self.navigationController?.popViewController(animated: false)
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadLeftItem()
        loadDetailTable()
    }
    
    //MARK: ------ loading ------
    func loadLeftItem() {
        let left = UIButton.init(type: UIButtonType.custom)
        left.frame = CGRect.init(x: 0, y: 0, width: 30, height: 44)
//        left.backgroundColor = cyanColor
        left.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        left.setImage(UIImage.init(named: "LeftBack"), for: UIControlState.normal)
        left.addTarget(self, action: #selector(leftAction), for: UIControlEvents.touchUpInside)
        
        let leftItem = UIBarButtonItem.init(customView: left)
        self.navigationItem.leftBarButtonItem = leftItem
    }
    
    func loadDetailTable() {
        detailTable = UITableView.init(frame: self.view.frame, style: UITableViewStyle.grouped)
        detailTable?.delegate = self;
        detailTable?.dataSource = self;
        detailTable?.backgroundColor = clearColor
        self.view.addSubview(detailTable!)
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        
    }
    
    //MARK: ------ other ------
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
