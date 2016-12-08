//
//  HomeViewController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/2.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class HomeViewController: SuperViewController,UITableViewDelegate, UITableViewDataSource {
    
    // MARK: Constants && Variables
    var homeTableView: UITableView?
    var homeSearchBar: UISearchBar?
    var cellHeight: CGFloat = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = BACK_COLOR
        self.navigationItem.title = "Home"
        
        buildLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: ------ <#delegate#> ------
    // MARK: UITableViewDataSource && Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let homeTableViewCell = NLABHomeCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cellID")
            
            
//            UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        homeTableViewCell.selectionStyle = UITableViewCellSelectionStyle.none
        homeTableViewCell.backgroundColor = whiteColor
        cellHeight = homeTableViewCell.cellHeight()

//        homeTableViewCell.textLabel?.text = String.init(format: "第%d行", indexPath.row)
        return homeTableViewCell

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200 * RATIO_WIDTH
        return cellHeight
    }
    
    
    
    
    //MARK: ------ action ------
    // MARK: clickBtnAction
    func didClickProfileBtn() {
//        XXZLog("clickProfileBtn")
        let friendFocusVC = NLABFriendFocusViewController()
        self.navigationController?.pushViewController(friendFocusVC, animated: true)
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
        defineMyTableView()
    }
    
    // MARK: ----- buildNavigationBar
    func buildNavi() {
        let profileBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH))
        profileBtn.setImage(UIImage.init(named: "navigationbar_friendsearch"), for: UIControlState.normal)
        profileBtn.backgroundColor = blueColor
        profileBtn.addTarget(self, action:#selector(didClickProfileBtn), for: UIControlEvents.touchUpInside)
        //        profileBtn.backgroundColor = UIColor.blue
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: profileBtn)
        
        
        let myDefineBtn = NLABDefineBtnOfHomeTitle.init(frame: CGRect.init(x: 0, y: 20 * RATIO_WIDTH, width: 100 * RATIO_WIDTH, height: 40 * RATIO_WIDTH), text: "userNick", image: "navigationbar_arrow_down")
        myDefineBtn.addTarget(self, action: #selector(didClickTitleView), for: UIControlEvents.touchUpInside)
        myDefineBtn.backgroundColor = redColor
        self.navigationItem.titleView = myDefineBtn
        
        let otherActionBtn = UIButton.init(frame: CGRect.init(x: 0, y: 0, width: 44 * RATIO_WIDTH, height: 44 * RATIO_WIDTH))
        otherActionBtn.imageView?.image = UIImage.init(named: "navigationbar_more")
        otherActionBtn.setImage(UIImage.init(named: "navigationbar_more"), for: UIControlState.normal)
        otherActionBtn.backgroundColor = cyanColor
        otherActionBtn.addTarget(self, action: #selector(didClickOtherBtn), for: UIControlEvents.touchUpInside)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(customView: otherActionBtn)
        //        otherActionBtn.backgroundColor = UIColor.green
    }
    
    // MARK: ----- setupSearchBar -----
    func setupSearchBar() {
        let homeSearchBar = UISearchBar.init(frame: CGRect.init(x: 0, y: 60 * RATIO_WIDTH, width: SCREEN_WIDTH, height: 50 * RATIO_WIDTH))
        homeSearchBar.placeholder = "大家正在搜: 刘海先不要剪"
        homeSearchBar.searchBarStyle = UISearchBarStyle.default
//        homeSearchBar.searchBarStyle = UISearchBarStyle.prominent
//        homeSearchBar.searchBarStyle = UISearchBarStyle.minimal
        self.homeSearchBar = homeSearchBar
        self.view.addSubview(homeSearchBar)
    }
    
    func defineMyTableView() {
        let homeTableView = UITableView.init(frame: CGRect.init(x: 0, y: self.homeSearchBar!.maxY, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - self.homeSearchBar!.maxY - (self.tabBarController?.tabBar.height)!), style: UITableViewStyle.plain)
        homeTableView.backgroundColor = clearColor
        self.homeTableView = homeTableView
        self.homeTableView?.delegate = self
        self.homeTableView?.dataSource = self
        self.homeTableView?.separatorStyle = UITableViewCellSeparatorStyle.none
        self.view.addSubview(homeTableView)
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
