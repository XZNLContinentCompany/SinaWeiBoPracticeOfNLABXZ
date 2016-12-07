//
//  ConcreteDetailController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/7.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class ConcreteDetailController: SuperViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ------ constant & variable ------
    var index: Int?
    var concreteArr: [Any]?
    var concreteTable: UITableView?
    var clickRightView: ClickRightView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "微博正文"
        buildLayout()
    }

    //MARK: ------ UITableViewDataSource ------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return 10
        }
        
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let identifier: String = "ConcreteDetailZeroSectionCellIdentifier"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell==nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }
            //conding...
            
            if let index = index {
                if let arr = concreteArr {
                    cell?.textLabel?.text = "\(arr[index])"
                }
            }
            
            return cell!
        }
        else if indexPath.section == 1 {
            let identifier: String = "ConcreteDetailOneSectionCellIdentifier"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell==nil {
                cell = ConcreteOneCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }
            //conding...
            
            let info = [
                ["title":"1111", "from":"Zachary"],
                ["title":"2222", "from":"Zachary"],
                ["title":"3333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333333", "from":"Zachary"]]
            
            (cell as! ConcreteOneCell?)?.concreteOneCell(indexPath, 110*RATIO_WIDTH, info)
            
            return cell!
        }
        else {
            let identifier: String = "ConcreteDetailTwoSectionCellIdentifier"
            
            var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            if cell==nil {
                cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
                cell?.selectionStyle = UITableViewCellSelectionStyle.none
            }
            //conding...
            
            
            return cell!
        }
    }
    
    //MARK: ------ UITableViewDelegate ------
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init()
        
        if section == 2 {
            headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 30*RATIO_WIDTH)
            headerView.backgroundColor = whiteColor
            
            let distance_x = 15*RATIO_WIDTH
            let width: CGFloat = (headerView.width-distance_x*2)/3
            
            //转发
            let transpond = UILabel.init(frame: CGRect.init(x: distance_x, y: 0, width: width, height: headerView.height))
            transpond.textAlignment = NSTextAlignment.left
            transpond.textColor = UICOLOR_DARK
            transpond.font = FONT_12
//            transpond.backgroundColor = cyanColor
            headerView.addSubview(transpond)
            
            //评论
            let comment = UILabel.init(frame: CGRect.init(x: transpond.maxX+1, y: 0, width: width-1, height: headerView.height))
            comment.textAlignment = NSTextAlignment.left
            comment.textColor = UICOLOR_DARK
            comment.font = FONT_12
//            comment.backgroundColor = cyanColor
            headerView.addSubview(comment)
            
            //赞
            let favour = UILabel.init(frame: CGRect.init(x: comment.maxX+1, y: 0, width: width-1, height: headerView.height))
            favour.textAlignment = NSTextAlignment.right
            favour.textColor = UICOLOR_DARK
            favour.font = FONT_12
//            favour.backgroundColor = cyanColor
            headerView.addSubview(favour)
            
            //分割线
            let horiLine = UIView.init(frame: CGRect.init(x: 0, y: headerView.height-0.5, width: headerView.width, height: 0.5))
            horiLine.backgroundColor = LINE_COLOR
            headerView.addSubview(horiLine)
            
            //赋值
            transpond.text = "转发 \(1111)"
            comment.text = "评论 \(2222)"
            favour.text = "赞 \(3333)"
        }
        
        return headerView
    }
    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView.init()
//        footerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: <#30*RATIO_WIDTH#>)
//        footerView.backgroundColor = LINE_COLOR
//        
//        return footerView
//    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 2 {
            return 30*RATIO_WIDTH
        }
        else {
            return 0.01
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 2 {
            return 0.01
        }
        
        return 10*RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 44*RATIO_WIDTH
        }
        else if indexPath.section == 1 {
            return 110*RATIO_WIDTH
        }
        else {
            return 44.0*RATIO_WIDTH
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    //MARK: ------ action ------
    func rightAction() {
        XXZLog("right item")
        
        clickRightView?.showAnimated()
    }
    
    var defaultFavourStatus: Bool = false
    func bottomButtonAction(_ bottom: BottomButton) {
        let index = bottom.tag
        XXZLog("index = \(index)")
        
        if index == 1000 { //转发
            
        }
        else if index == 1001 { //评论
            
        }
        else { //赞
            defaultFavourStatus = !defaultFavourStatus
            bottom.favourAnimated(defaultFavourStatus)
            
        }
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadRightItem()
        loadConcreteTable()
        loadBottomView()
        loadHeaderView()
        
        loadClickRightView()
    }
    
    //MARK: ------ loading ------
    func loadClickRightView() {
        clickRightView = ClickRightView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        UIApplication.shared.keyWindow?.addSubview(clickRightView!)
    }
    
    func loadHeaderView() {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 5*RATIO_WIDTH))
        headerView.backgroundColor = clearColor
        concreteTable?.tableHeaderView = headerView
    }
    
    func loadConcreteTable() {
        concreteTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-BOTTOM_HEIGHT), style: UITableViewStyle.plain)
        concreteTable?.delegate = self
        concreteTable?.dataSource = self
        concreteTable?.backgroundColor = clearColor
        self.view.addSubview(concreteTable!)
    }
    
    func loadBottomView() {
        let bottomView = UIView.init(frame: CGRect.init(x: 0, y: SCREEN_HEIGHT-BOTTOM_HEIGHT, width: SCREEN_WIDTH, height: BOTTOM_HEIGHT))
        bottomView.backgroundColor = whiteColor
        self.view.addSubview(bottomView)
        
        bottomView.layer.shadowColor = blackColor.cgColor
        bottomView.layer.shadowOffset = CGSize.init(width: 0, height: -1.0)
        bottomView.layer.shadowOpacity = 0.1
        bottomView.layer.shadowRadius = 1
        
        let width: CGFloat = bottomView.width/3
        let markNameArr = ["转发", "评论", "赞"]
        for i in 0..<3 {
            let bottomButton = BottomButton.init(frame: CGRect.init(x: CGFloat(i)*width, y: 0, width: width-1, height: bottomView.height))
            bottomButton.tag = 1000+i
            bottomButton.mark?.text = markNameArr[i]
            bottomView.addSubview(bottomButton)
            
            bottomButton.addTarget(self, action: #selector(bottomButtonAction(_:)), for: UIControlEvents.touchUpInside)
        }
    }
    
    func loadRightItem() {
        let rightItem = UIBarButtonItem.init(title: "• • •", style: UIBarButtonItemStyle.plain, target: self, action: #selector(rightAction))
        self.navigationItem.rightBarButtonItem = rightItem
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
