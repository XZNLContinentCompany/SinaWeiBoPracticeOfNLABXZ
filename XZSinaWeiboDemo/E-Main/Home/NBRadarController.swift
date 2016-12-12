//
//  NBRadarController.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NBRadarController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BACK_COLOR
        self.title = "雷达"
        // Do any additional setup after loading the view.
        
        buildSubViews()
    }
    
    // MARK: LayoutViews
    func buildSubViews() {
        buildNavi()
        buildBottomView()
    }
    
    // MARK: buildNavi
    func buildNavi() {
        let closeBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        closeBtn.setTitle("关闭", for: UIControlState.normal)
        closeBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: closeBtn)
        
        let moreBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44, height: 44))
        moreBtn.setTitle("更多", for: UIControlState.normal)
        moreBtn.addTarget(self, action: #selector(goMore), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: moreBtn)
    }
    
    func buildBottomView() {
        let bottomViewArr = ["热门","优惠","电影","电视","打车"]
        let btnW = CGFloat(40.0 * RATIO_WIDTH)
        let arrCount = CGFloat(bottomViewArr.count)
        let margin = (SCREEN_WIDTH - btnW * arrCount) / CGFloat(arrCount + 1)
        for index in 0 ..< bottomViewArr.count {
            let btn = UIButton.init(frame: CGRect.init(x: margin * CGFloat(index + 1) + btnW * CGFloat(index), y: SCREEN_HEIGHT - 20 * RATIO_WIDTH - btnW, width: btnW, height: btnW))
            btn.setTitle(bottomViewArr[index], for: UIControlState.normal)
            btn.setTitleColor(grayColor, for: UIControlState.normal)
            btn.setTitleColor(redColor, for: UIControlState.selected)
            btn.tag = index + 100
            btn.addTarget(self, action: #selector(clickBtn(_:)), for: UIControlEvents.touchUpInside)
            if index == 0 {
                btn.isSelected = true
            }
            
        }
    }
    
    // MARK: -----  Action  ------
    // MARK:  --- clickBtnAction ----
    func back() {
        
    }
    
    func goMore() {
        
    }
    
    func clickBtn(_ btn: UIButton) {
        if btn.tag == 100 {
            //  跳转到热门
        } else if btn.tag == 101 {
            //  跳转到优惠
        } else if btn.tag == 102 {
            //  跳转到电影
        } else if btn.tag == 103 {
            //  跳转到电视
        } else if btn.tag == 104 {
            //  跳转到打车
        } else {
            XXZLog("数据有误")
        }
    }

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
