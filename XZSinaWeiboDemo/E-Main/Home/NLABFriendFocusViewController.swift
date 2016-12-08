//
//  NLABFriendFocusViewController.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/8.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NLABFriendFocusViewController: UIViewController {
    var childVCTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "好友关注动态"
        self.view.backgroundColor = BACK_COLOR
        
        layoutViews()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    // MARK: LayoutViews
    func layoutViews() {
        layoutNavigationBar()
    }
    
    // MARK: LayoutNaviBar 
    func layoutNavigationBar() {
        
        let backBtn = NLABBackBtn.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH), title: "首页")
        backBtn.addTarget(self, action: #selector(clickBackBtn), for: UIControlEvents.touchUpInside)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: backBtn)
        
        
        let setBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH))
        setBtn.setTitle("设置", for: UIControlState.normal)
        setBtn.setTitleColor(blackColor, for: UIControlState.normal)
        setBtn.titleLabel?.font = FONT_15
        setBtn.addTarget(self, action: #selector(clickSetBtn), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: setBtn)
    }

    // MARK: Action
    // MARK: ClickBtnAction
    func clickSetBtn() {
        
    }
    
    func clickBackBtn() {
        self.navigationController!.popViewController(animated: true)
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
