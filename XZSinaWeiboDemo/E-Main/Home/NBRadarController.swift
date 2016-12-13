//
//  NBRadarController.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NBRadarController: UIViewController {
    var selectedBtn: UIButton?
    var tipsBtn: UIButton?

    // MARK: -----  init  -----
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        NotificationCenter.default.addObserver(self, selector: #selector(receiveNoti), name: NSNotification.Name(rawValue:"pushToGoOut"), object: nil)
    }
    
    // MARK: noti
    func receiveNoti() {
        let goOutVC = NBGoOutController()
        self.present(goOutVC, animated: true, completion: nil)
    }

    // MARK: ------  liftCircle  ------
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BACK_COLOR
//        self.title = "雷达"
        // Do any additional setup after loading the view.
        
        buildSubViews()
    }
    
    // MARK: LayoutViews
    func buildSubViews() {
        buildNavi()
        buildBottomView()
        buildTipsBtn()
    }
    
    // MARK: buildNavi
    func buildNavi() {
        //  leftBtn
        let closeBtn = UIButton.init(frame: CGRect.init(x: 20 * RATIO_WIDTH, y: 20 * RATIO_WIDTH, width: 44, height: 44))
        closeBtn.setTitle("关闭", for: UIControlState.normal)
        closeBtn.addTarget(self, action: #selector(back), for: UIControlEvents.touchUpInside)
        closeBtn.setTitleColor(blackColor, for: UIControlState.normal)
        self.view.addSubview(closeBtn)
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: closeBtn)
        
        //  rightBtn
        let moreBtn = UIButton.init(frame: CGRect.init(x: SCREEN_WIDTH - 20 * RATIO_WIDTH - 44, y: 20 * RATIO_WIDTH, width: 44, height: 44))
        moreBtn.setTitle("更多", for: UIControlState.normal)
        moreBtn.addTarget(self, action: #selector(goMore), for: UIControlEvents.touchUpInside)
        moreBtn.setTitleColor(blackColor, for: UIControlState.normal)
        self.view.addSubview(moreBtn)
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: moreBtn)
        
        //  middleBtn
        let titleH = 20 * RATIO_WIDTH
        let titleW = 70 * RATIO_WIDTH
        let titleBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - titleW) / 2, y: 20 * RATIO_WIDTH + (44 - titleH) / 2, width: titleW, height: titleH))
        titleBtn.setTitleColor(blackColor, for: UIControlState.normal)
        titleBtn.setTitle("雷达", for: UIControlState.normal)
        self.view.addSubview(titleBtn)
    }
    
    // MARK: buildBottom
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
                selectedBtn = btn
            }
            self.view.addSubview(btn)
        }
    }
    
    // MARK: buildTips
    func buildTipsBtn() {
        let tipsH = 200 * RATIO_WIDTH
        tipsBtn = UIButton.init(frame: CGRect.init(x: (SCREEN_WIDTH - tipsH) / 2, y: (SCREEN_HEIGHT - tipsH) / 2, width: tipsH, height: tipsH))
        tipsBtn?.setTitleColor(grayColor, for: UIControlState.normal)
        tipsBtn?.setTitle("点击雷达，探索周边新鲜事", for: UIControlState.normal)
        tipsBtn?.titleLabel?.font = FONT_15
        self.view.addSubview(tipsBtn!)
    }
    
    // MARK: -----  Action  ------
    // MARK:  --- clickBtnAction ----
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func goMore() {
        
    }
    
    func clickBtn(_ btn: UIButton) {
        selectedBtn?.isSelected = !(selectedBtn?.isSelected)!
        btn.isSelected = true
        selectedBtn = btn
        if btn.tag == 100 {
            tipsBtn?.setTitle("点击雷达，探索周边新鲜事", for: UIControlState.normal)
        } else if btn.tag == 101 {
            tipsBtn?.setTitle("点击雷达，开始探索", for: UIControlState.normal)
        } else if btn.tag == 102 {
            tipsBtn?.setTitle("点击雷达，探索新鲜影讯", for: UIControlState.normal)
        } else if btn.tag == 103 {
            tipsBtn?.setTitle("点击雷达，探索极限精彩", for: UIControlState.normal)
        } else if btn.tag == 104 {
            //  跳转到打车
            let goOutVC = NBGoOutController()
            self.present(goOutVC, animated: true, completion: nil)
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
