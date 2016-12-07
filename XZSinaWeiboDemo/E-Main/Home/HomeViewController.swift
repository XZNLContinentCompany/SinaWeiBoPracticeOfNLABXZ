//
//  HomeViewController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/2.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class HomeViewController: SuperViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = BACK_COLOR
        self.navigationItem.title = "Home"
        
        buildLayout()
    }
    
    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    // MARK: clickBtnAction
    func didClickProfileBtn() {
        XXZLog("clickProfileBtn")
    }
    
    func didClickTitleView() {
        XXZLog("clickTitle")
    }
    
    func didClickOtherBtn() {
        XXZLog("clickOtherBtn")
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        buildNavi()
        setupSearchBar()
        
    }
    
    // MARK: ----- buildNavigationBar
    func buildNavi() {
        let profileBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH))
        profileBtn.setImage(UIImage.init(named: "navigationbar_friendsearch"), for: UIControlState.normal)
        profileBtn.addTarget(self, action:#selector(didClickProfileBtn), for: UIControlEvents.touchUpInside)
        //        profileBtn.backgroundColor = UIColor.blue
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: profileBtn)
        
        
        let myDefineBtn = NLABDefineBtnOfHomeTitle.init(frame: CGRect.init(x: 0, y: 20 * RATIO_WIDTH, width: 100 * RATIO_WIDTH, height: 40 * RATIO_WIDTH), text: "userNick", image: "navigationbar_arrow_down")
        myDefineBtn.addTarget(self, action: #selector(didClickTitleView), for: UIControlEvents.touchUpInside)
        self.navigationItem.titleView = myDefineBtn
        
        #if false
            let titleAndSelecBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 100 * RATIO_WIDTH, height: 40 * RATIO_WIDTH))
            titleAndSelecBtn.titleEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 20)
            titleAndSelecBtn.titleLabel?.text = "userNick"
            titleAndSelecBtn.titleLabel?.textColor = UIColor.darkText
            titleAndSelecBtn.titleLabel?.textAlignment = NSTextAlignment.center
            titleAndSelecBtn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            titleAndSelecBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 70, 0, 0)
            titleAndSelecBtn.imageView?.image = UIImage.init(named: "navigationbar_arrow_down")
            titleAndSelecBtn.addTarget(self, action: #selector(didClickTitleView), for: UIControlEvents.touchUpInside)
            self.navigationItem.titleView = titleAndSelecBtn
            //        titleAndSelecBtn.backgroundColor = UIColor.red
        #endif
        
        let otherActionBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH))
        otherActionBtn.imageView?.image = UIImage.init(named: "navigationbar_more")
        otherActionBtn.setImage(UIImage.init(named: "navigationbar_more"), for: UIControlState.normal)
        otherActionBtn.addTarget(self, action: #selector(didClickOtherBtn), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: otherActionBtn)
        //        otherActionBtn.backgroundColor = UIColor.green
    }
    
    // MARK: ----- setupSearchBar -----
    func setupSearchBar() {
        
    }
    
    
    
    //MARK: ------ loading ------
    
    
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
