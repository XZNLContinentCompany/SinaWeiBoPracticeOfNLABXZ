//
//  DiscoverDetailController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/6.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

typealias CurrentPageClosure = ((Int) -> ()) //有参无返回值的闭包

class DiscoverDetailController: SuperViewController, UIScrollViewDelegate, DetailNavBarViewDelegate, DetailTableViewDelegate {

    //MARK: ------ constant & variable ------
    var detailArr: [Any]?
    var menuIndex: Int = 0
    
    var detailTable: UITableView?
    var scrollMaskView: UIScrollView?
    var detailNacBarView: DetailNavBarView?
    
    var currentPageClosure: CurrentPageClosure?
    
    //MARK: ------ view will appear & disappear ------
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //coding...
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //coding...
        
        
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
//        self.navigationItem.title = ""
        
        buildLayout()
        
//        if let value = detailArr {
//            XXZLog(value)
//        }
    }
    
    //MARK: ------ UIScrollViewDelegate ------
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.tag == 8000 {
            let off_x = scrollView.contentOffset.x
            detailNacBarView?.scrollMenuMovingAnimated(off_x)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let off_x = scrollView.contentOffset.x
        
        if scrollView.tag == 8000 {
            detailNacBarView?.scrollMenuMovedAnimated(off_x)
            menuIndex = Int(off_x/scrollView.width)
        }
    }
    
    //MARK: ------ DetailNavBarViewDelegate ------
    func detailNavBarView(_ index: Int) {
        menuIndex = index
        
        UIView.animate(withDuration: 0.3, animations: {
            self.scrollMaskView?.contentOffset = CGPoint.init(x: (self.scrollMaskView?.width)!*CGFloat(index), y: 0)
        })
    }
    
    //MARK: ------ DetailTableViewDelegate ------
    func detailTableView(_ indexPath: IndexPath) {
        
        let concrete = ConcreteDetailController()
        self.navigationController?.pushViewController(concrete, animated: true)

        if let value = detailArr {
            concrete.index = indexPath.section
            concrete.concreteArr = (value as! Array<Array<String>>)[indexPath.section]
        }
    }
    
    //MARK: ------ action ------
    func leftAction() {
        let _ = self.navigationController?.popViewController(animated: false)
        
        currentPageClosure!(menuIndex)
    }
    
    //MARK: ------ build layout ------
    func buildLayout() {
        loadLeftItem()
        loadDetailNavBarView()
        loadScrollMaskView()
    }
    
    //MARK: ------ loading ------
    func loadDetailNavBarView() {
        detailNacBarView = DetailNavBarView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH-(15*2+30)*RATIO_WIDTH, height: 44))
        detailNacBarView?.delegate = self
        detailNacBarView?.getLastMenuButton(menuIndex)
        self.navigationItem.titleView = detailNacBarView
    }
    
    func loadLeftItem() {
        let left = UIButton.init(type: UIButtonType.custom)
        left.frame = CGRect.init(x: 0, y: 0, width: 30, height: 44)
//        left.backgroundColor = cyanColor
        left.contentEdgeInsets = UIEdgeInsets.init(top: 0, left: -20, bottom: 0, right: 0)
        left.setImage(UIImage.init(named: "LeftBack"), for: UIControlState.normal)
        left.addTarget(self, action: #selector(leftAction), for: UIControlEvents.touchUpInside)
        
        let leftItem = UIBarButtonItem.init(customView: left)
        self.navigationItem.leftBarButtonItem = leftItem
        
        let rightItem = UIBarButtonItem.init(title: "", style: UIBarButtonItemStyle.plain, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = rightItem
    }
    
    func loadScrollMaskView() {
        scrollMaskView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        scrollMaskView?.delegate = self
        scrollMaskView?.tag = 8000
//        scrollMaskView?.backgroundColor = purpleColor
        scrollMaskView?.isPagingEnabled = true
        scrollMaskView?.bounces = false
        scrollMaskView?.contentSize = CGSize.init(width: SCREEN_WIDTH*4, height: 0)
        scrollMaskView?.contentOffset = CGPoint.init(x: SCREEN_WIDTH*CGFloat(menuIndex), y: 0)
        self.view.addSubview(scrollMaskView!)
        
        self.automaticallyAdjustsScrollViewInsets = false
        for i in 0..<4 {
            let detailTableView = DetailTableView.init(frame: CGRect.init(x: CGFloat(i)*SCREEN_WIDTH, y: STATUS_NAV_HEIGHT, width: SCREEN_WIDTH-1, height: SCREEN_HEIGHT-STATUS_NAV_HEIGHT))
            detailTableView.delegate = self;
            detailTableView.detailArr = (detailArr as! Array<Array<String>>)[i]
            scrollMaskView?.addSubview(detailTableView)
        }
    }
    
    //MARK: ------ method ------
    
    
    //MARK: ------ deinit ------
    deinit {
        //coding...
        detailNacBarView?.delegate = nil
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
