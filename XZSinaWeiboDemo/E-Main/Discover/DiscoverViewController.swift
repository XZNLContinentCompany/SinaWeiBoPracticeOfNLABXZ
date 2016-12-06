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
    
    var searchMaskView: UIView?
    var statusView: UIView?
    
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
        self.view.backgroundColor = whiteColor
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
            cell?.selectionStyle = UITableViewCellSelectionStyle.none
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
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = clearColor
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 10.0*RATIO_WIDTH
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      XXZLog(indexPath.row)
    }
    
    //MARK: ------ UIScrollViewDelegate ------
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let off_y = scrollView.contentOffset.y+20.0
        XXZLog(off_y)
        
        var rect: CGRect = (self.searchMaskView?.frame)!
        if off_y <= (20+40*RATIO_WIDTH) && off_y >= 0 {
            rect.origin.y = -off_y
            
            let alphaValue: CGFloat = off_y/(20+40*RATIO_WIDTH)
            statusView?.alpha = alphaValue
//            XXZLog("alphaValue = \(alphaValue)")
        }
        else if  off_y <= 0 {
            rect.origin.y = 0
            
            statusView?.alpha = 0.0
        }
        else {
            rect.origin.y = -(20+40*RATIO_WIDTH)
            
            statusView?.alpha = 1.0
        }
        self.searchMaskView?.frame = rect
    }
    
    //MARK: ------ action ------
    func itemButtonAction(_ item: ItemButton) {
        let tag = item.tag-2000
        
        switch tag {
        case 9:
            XXZLog("滑出第三行")
            let itemMaskView = headerView?.viewWithTag(9003)
            let cellMaskView = headerView?.viewWithTag(9004)
            
            var itemMaskHeight: CGFloat = 70*2*RATIO_WIDTH
            var headerViewChange: CGFloat = -70*RATIO_WIDTH
            
            if !isShowItemMore {
                itemMaskHeight = 70*3*RATIO_WIDTH
                headerViewChange = 70*RATIO_WIDTH
            }
            isShowItemMore = !isShowItemMore
            
            UIView.animate(withDuration: 0.3, animations: {
                var itemMaskRect: CGRect = (itemMaskView?.frame)!
                var cellMaskRect: CGRect = (cellMaskView?.frame)!
                var headerViewRect: CGRect = (self.headerView?.frame)!
                
                itemMaskRect.size.height = itemMaskHeight
                cellMaskRect.origin.y = itemMaskRect.origin.y+itemMaskRect.size.height
                headerViewRect.size.height += headerViewChange
//                XXZLog("\(headerViewRect.size.height)")
                
                itemMaskView?.frame = itemMaskRect
                cellMaskView?.frame = cellMaskRect
                self.headerView?.frame = headerViewRect
                
                self.discoverTable?.tableHeaderView = self.headerView
            })
            
        default:
            XXZLog("第\(tag)个")
        }
    }
    
    func cellButtonAction(_ cell: CellButton) {
        let tag = cell.tag-3000
        
        XXZLog("tag = \(tag)")
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadDiscoverTable()
        loadSearchBarView()
        loadStatusView()
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
        let scrollMaskView = UIScrollView.init(frame: CGRect.init(x: 0, y: menuView.maxY+1, width: SCREEN_WIDTH, height: SCREEN_HEIGHT-NAV_BAR_HEIGHT))
        scrollMaskView.backgroundColor = cyanColor
        scrollMaskView.contentSize = CGSize.init(width: SCREEN_WIDTH*4, height: 0)
        scrollMaskView.isPagingEnabled = true
        scrollMaskView.bounces = false
        scrollMaskView.showsVerticalScrollIndicator = false
        scrollMaskView.isDirectionalLockEnabled = true
        footerView?.addSubview(scrollMaskView)
        
        loadScrollMaskView(scrollMaskView)
    }
    
    func loadScrollMaskView(_ view: UIScrollView) {
        
//        for i in 0..<4 {
            let subTableView = SubTableView.init(CGRect.init(x: 0, y: 0, width: view.width, height: view.height), "FirstSubTableCellIdentifier", ["阿炳艳照门事件", "阿炳发明了无线自动实现接客系统", "二十一世纪感动中国: 阿炳"])
        subTableView.isUserInteractionEnabled = false
        view.addSubview(subTableView)
            
//        }
    }
    
    func loadTableHeaderView() {
        let search_height = 40*RATIO_WIDTH
        let scroll_height = 80*RATIO_WIDTH
        let item_height = 70*3*RATIO_WIDTH
        let cell_height = (40*2+10)*RATIO_WIDTH
        let header_height: CGFloat = search_height+scroll_height+item_height+cell_height
        
        headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: header_height-item_height/3))
        headerView?.backgroundColor = whiteColor
        discoverTable?.tableHeaderView = headerView
        
        //滚动视图
        let scrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: search_height, width: SCREEN_WIDTH, height: scroll_height))
        scrollView.backgroundColor = magentaColor
        scrollView.tag = 9002
        headerView?.addSubview(scrollView)
        
        //项目视图
        let itemMaskView = UIView.init(frame: CGRect.init(x: 0, y: scrollView.maxY, width: SCREEN_WIDTH, height: item_height))
        itemMaskView.backgroundColor = whiteColor
        itemMaskView.tag = 9003
        headerView?.addSubview(itemMaskView)
        
        loadItemButton(itemMaskView)
        
        //格子视图
        let cellMaskView = UIView.init(frame: CGRect.init(x: 0, y: itemMaskView.maxY-item_height/3, width: SCREEN_WIDTH, height: cell_height))
        cellMaskView.backgroundColor = clearColor
        cellMaskView.tag = 9004
        headerView?.addSubview(cellMaskView)
        
        loadCellButton(cellMaskView)
    }
    
    func loadCellButton(_ view: UIView) {
        let height: CGFloat = (view.height-10*RATIO_WIDTH)/2
        let width: CGFloat = SCREEN_WIDTH/2
        let cellNameArr = ["阿炳疯了", "阿炳陆家嘴事件", "阿炳优衣库事件", "尼古拉斯•阿炳"]
        
        for i in 0..<2 {
            for j in 0..<2 {
                let index = (j+i*2)
                
                let cellButton = CellButton.init(frame: CGRect.init(x: CGFloat(j)*(width), y: 10*RATIO_WIDTH+CGFloat(i)*(height), width: width, height: height))
                cellButton.backgroundColor = whiteColor
                view.addSubview(cellButton)
                
                cellButton.tag = 3000+index
                cellButton.mark?.text = "#\(cellNameArr[index])#"
                cellButton.addTarget(self, action: #selector(cellButtonAction(_:)), for: UIControlEvents.touchUpInside)
            }
            
            let horiLine = UIView.init(frame: CGRect.init(x: 0, y: CGFloat(i)*height+10*RATIO_WIDTH, width: view.width, height: 0.5))
            horiLine.backgroundColor = LINE_COLOR
            view.addSubview(horiLine)
            
            if i==1 {
                horiLine.frame = CGRect.init(x: 5, y: horiLine.y, width: horiLine.width-10, height: horiLine.height)
            }
        }
    }
    
    func loadItemButton(_ view: UIView) {
        let width: CGFloat = SCREEN_WIDTH/5
        let height = view.height/3
        let itemNameArr = [
            "找人", "北京", "游戏", "股票", "电影",
            "夺宝", "直播", "尤物", "音乐", "更多",
            "红人淘", "运动课", "鲜城", "汽车"]
        
        for i in 0..<3 {
            for j in 0..<5 {
                if (j+i*5) >= 14 {
                    return
                }
                
                let itemButton = ItemButton.init(frame: CGRect.init(x: CGFloat(j)*(width), y: CGFloat(i)*height, width: width, height: height))
//                itemButton.backgroundColor = greenColor
                itemButton.tag = 2000+(j+i*5)
                view.addSubview(itemButton)
                
                itemButton.mark?.text = itemNameArr[(j+i*5)]
                itemButton.addTarget(self, action: #selector(itemButtonAction(_:)), for: UIControlEvents.touchUpInside)
            }
        }
        
    }
    
    func loadDiscoverTable() {
        discoverTable = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT), style: UITableViewStyle.grouped)
        discoverTable?.delegate = self
        discoverTable?.dataSource = self
        discoverTable?.keyboardDismissMode = UIScrollViewKeyboardDismissMode.onDrag
        discoverTable?.backgroundColor = BACK_COLOR
        self.view.addSubview(discoverTable!)
    }
    
    func loadSearchBarView() {
        let search_height = 40*RATIO_WIDTH
        
        searchMaskView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: search_height+20))
        searchMaskView?.backgroundColor = whiteColor
        self.view.addSubview(searchMaskView!)
        
        //搜索视图
        let searchView = UISearchBar.init(frame: CGRect.init(x: 0, y: 20, width: SCREEN_WIDTH, height: search_height))
        searchView.tag = 2001
        searchView.backgroundColor = whiteColor
//        searchView.barTintColor = cyanColor //无效果
//        searchView.tintColor = redColor //无效果
        searchView.searchBarStyle = UISearchBarStyle.minimal //prominent 显示背景, minimal 不显示背景
        searchMaskView?.addSubview(searchView)
        
        searchView.placeholder = "大家正在搜索: 阿炳地王大厦事件"
    }
    
    func loadStatusView() {
        statusView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: 20))
        statusView?.backgroundColor = whiteColor
        statusView?.alpha = 0.0
        self.view.addSubview(statusView!)
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
