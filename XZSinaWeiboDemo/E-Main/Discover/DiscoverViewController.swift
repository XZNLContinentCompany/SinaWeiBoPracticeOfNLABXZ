//
//  DiscoverViewController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/2.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class DiscoverViewController: SuperViewController, UITableViewDelegate, UITableViewDataSource {

    //MARK: ------ constant & variable ------
    var discoverTable: UITableView?
    var headerView: UIView?
    var footerView: UIView?
    var isShowItemMore: Bool = false
    
    //MARK: ------ view will appear & disappear ------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //coding...
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //coding...
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        //coding...
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //coding...
        
    }
    
    //MARK: ------ view did load ------
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = BACK_COLOR
        self.navigationItem.title = "Discover"
        
        buildLayout()
    }

    //MARK: ------ UITableViewDataSource ------
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "DiscoverCellIdentifier"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if cell==nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        //conding...
        
        
        return cell!
    }
    
    //MARK: ------ UITableViewDelegate ------
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView.init()
//        headerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 0)
//        headerView.backgroundColor = LINE_COLOR
//        
//        return headerView
//    }
//    
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = UIView.init()
//        footerView.frame = CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 0)
//        footerView.backgroundColor = LINE_COLOR
//        
//        return footerView
//    }
//    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 0.01
//    }
//    
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 0.01
//    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = clearColor
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0*RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      XXZLog(indexPath.row)
    }
    
    
    //MARK: ------ action ------
    func itemButtonAction(_ item: ItemButton) {
        let tag = item.tag-1000
        
        switch tag {
        case 9:
            XXZLog("滑出第三行")
            let itemMaskView = self.view.viewWithTag(2003)
            let cellMaskView = self.view.viewWithTag(2004)
            
            var itemMaskHeight: CGFloat = 80*2*RATIO_WIDTH
            var headerViewChange: CGFloat = -80*RATIO_WIDTH
            
            if !isShowItemMore {
                itemMaskHeight = 80*3*RATIO_WIDTH
                headerViewChange = 80*RATIO_WIDTH
            }
            isShowItemMore = !isShowItemMore
            
            UIView.animate(withDuration: 0.5, animations: {
                var itemMaskRect: CGRect = (itemMaskView?.frame)!
                var cellMaskRect: CGRect = (cellMaskView?.frame)!
                var headerViewRect: CGRect = (self.headerView?.frame)!
                
                itemMaskRect.size.height = itemMaskHeight
                cellMaskRect.origin.y = itemMaskRect.origin.y+itemMaskRect.size.height
                headerViewRect.size.height += headerViewChange
                
                itemMaskView?.frame = itemMaskRect
                cellMaskView?.frame = cellMaskRect
                self.headerView?.frame = headerViewRect
                
                self.discoverTable?.tableHeaderView = self.headerView
            })
            
        default:
            XXZLog("第\(tag)个")
        }
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadDiscoverTable()
        loadTableHeaderView()
        loadTableFooterView()
    }
    
    //MARK: ------ loading ------
    func loadTableFooterView() {
        footerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        footerView?.backgroundColor = clearColor
        discoverTable?.tableFooterView = footerView
        
        //菜单
        let menuView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 40*RATIO_WIDTH))
        menuView.backgroundColor = whiteColor
        footerView?.addSubview(menuView)
        
        //滚动视图蒙版
        let scrollMaskView = UIScrollView.init(frame: CGRect.init(x: 0, y: menuView.maxY+1, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-NAV_BAR_HEIGHT*5))
        scrollMaskView.backgroundColor = cyanColor
        scrollMaskView.contentSize = CGSize.init(width: SCREEN_WIDTH*4, height: SCREEN_HEIGHT)
        scrollMaskView.isPagingEnabled = true
        scrollMaskView.bounces = false
        scrollMaskView.showsVerticalScrollIndicator = false
        scrollMaskView.isDirectionalLockEnabled = true
        footerView?.addSubview(scrollMaskView)
        
    }
    
    func loadItemButton(_ view: UIView) {
        let width: CGFloat = SCREEN_WIDTH/5
        let height = view.height/3
        
        for i in 0..<3 {
            for j in 0..<5 {
                if (j+i*5) >= 14 {
                    return
                }
                
                let itemButton = ItemButton.init(frame: CGRect.init(x: CGFloat(j)*(width+1), y: CGFloat(i)*height, width: width, height: height-1))
//                itemButton.backgroundColor = greenColor
                itemButton.tag = 1000+(j+i*5)
                view.addSubview(itemButton)
                
                itemButton.mark?.text = "第\((j+i*5))个"
                if (j+i*5) == 9 {
                    itemButton.mark?.text = "更多"
                }
                
                itemButton.addTarget(self, action: #selector(itemButtonAction(_:)), for: UIControlEvents.touchUpInside)
            }
        }
        
    }
    
    func loadTableHeaderView() {
        let search_height = 40*RATIO_WIDTH
        let scroll_height = 80*RATIO_WIDTH
        let item_height = 80*3*RATIO_WIDTH
        let cell_height = 40*2*RATIO_WIDTH
        let header_height: CGFloat = search_height+scroll_height+item_height+cell_height
        
        headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: header_height-item_height/3))
        headerView?.backgroundColor = clearColor
        discoverTable?.tableHeaderView = headerView
        
        //搜索视图
        let searchView = UISearchBar.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: search_height))
        searchView.backgroundColor = redColor
        searchView.tag = 2001
        headerView?.addSubview(searchView)
        
        //滚动视图
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: searchView.maxY+1, width: SCREEN_WIDTH, height: scroll_height))
        scrollView.backgroundColor = magentaColor
        scrollView.tag = 2002
        headerView?.addSubview(scrollView)
        
        //项目视图
        let itemMaskView = UIView.init(frame: CGRect.init(x: 0, y: scrollView.maxY+1, width: SCREEN_WIDTH, height: item_height))
        itemMaskView.backgroundColor = whiteColor
        itemMaskView.tag = 2003
        headerView?.addSubview(itemMaskView)
        loadItemButton(itemMaskView)
        
        //格子视图
        let cellMaskView = UIView.init(frame: CGRect.init(x: 0, y: itemMaskView.maxY+1-item_height/3, width: SCREEN_WIDTH, height: cell_height))
        cellMaskView.backgroundColor = orangeColor
        cellMaskView.tag = 2004
        headerView?.addSubview(cellMaskView)
        
    }
    
    func loadDiscoverTable() {
        discoverTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.plain)
        discoverTable?.delegate = self
        discoverTable?.dataSource = self
        discoverTable?.backgroundColor = clearColor
        self.view.addSubview(discoverTable!)
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
