//
//  SuperViewController.swift
//  XZSinaWeiboDemo
//
//  Created by Jiayu_Zachary on 2016/12/2.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class SuperViewController: UIViewController {

    var myName: String?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = whiteColor
        self.navigationItem.title = "super"
        
        buildLayout()
    }

    //MARK: ------ <#delegate#> ------
    
    
    //MARK: ------ action ------
    
    
    //MARK: ------ build layout ------
    fileprivate func buildLayout() {
        myName = "xxz"
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


}

