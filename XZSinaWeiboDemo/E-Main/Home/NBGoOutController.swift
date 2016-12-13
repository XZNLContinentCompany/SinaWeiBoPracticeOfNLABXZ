//
//  NBGoOutController.swift
//  XZSinaWeiboDemo
//
//  Created by 张炳磊 on 2016/12/12.
//  Copyright © 2016年 Zachary. All rights reserved.
//

import UIKit

class NBGoOutController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        buildSubViews()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: buildViews
    func buildSubViews() {
        buildNavi()
        buildMobileLogin()
        buildLocationView()
    }
    
    // MARK: buildNavi
    func buildNavi() {
        let backBtn = UIButton.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: 20 * RATIO_WIDTH, width: 40, height: 40))
        backBtn.backgroundColor = cyanColor
        backBtn.addTarget(self, action: #selector(backUp), for: UIControlEvents.touchUpInside)
        
        let labelH = 20 * RATIO_WIDTH
        let labelW = 100 * RATIO_WIDTH
        let titleLabel = UILabel.init(frame: CGRect.init(x: (SCREEN_WIDTH - labelW) / 2, y: 20 * RATIO_WIDTH + (44 - labelH) / 2, width: labelW, height: labelH))
        titleLabel.text = "滴滴出行"
        titleLabel.textColor = blackColor
        
        self.view.addSubview(backBtn)
        self.view.addSubview(titleLabel)
    }
    
    // MARK: buildMobileLogin
    func buildMobileLogin() {
        let line1 = UIView.init(frame: CGRect.init(x: 0, y: 64, width: SCREEN_WIDTH, height: 0.5))
        line1.backgroundColor = RGB(230, 230, 230)
        
        let btnH = 55 * RATIO_WIDTH
        let btnW = 43 * RATIO_WIDTH
        let headBtn = UIButton.init(frame: CGRect.init(x: 0, y: 64 + 0.5, width: btnW, height: btnH))
//        headBtn.setImage(UIImage.init(named: ""), for: UIControlState.normal)
        headBtn.backgroundColor = greenColor
        headBtn.addTarget(self, action: #selector(clickHead(_:)), for: UIControlEvents.touchUpInside)
        
        let verLineH = 40 * RATIO_WIDTH
        let verticalLine = UIView.init(frame: CGRect.init(x: headBtn.maxX, y: (btnH - verLineH) / 2 + 64, width: 0.5, height: verLineH))
        verticalLine.backgroundColor = RGB(230, 230, 230)
        
        let line2 = UIView.init(frame: CGRect.init(x: 0, y: headBtn.maxY, width: SCREEN_WIDTH, height: 1))
        line2.backgroundColor = RGB(230, 230, 230)
        
        self.view.addSubview(line1)
        self.view.addSubview(headBtn)
        self.view.addSubview(verticalLine)
        self.view.addSubview(line2)
    }
    
    // MARK: buildLocation
    func buildLocationView() {
        let H = 100 * RATIO_WIDTH
        let bgView = UIView.init(frame: CGRect.init(x: 0, y: (SCREEN_HEIGHT - H) / 2, width: SCREEN_WIDTH, height: H))
        bgView.backgroundColor = clearColor
        
        //  currentLoc
        let btnH = 40 * RATIO_WIDTH
        let currentBtn = UIButton.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: (bgView.height - btnH * 2) / 2, width: SCREEN_WIDTH - 20 * RATIO_WIDTH, height: btnH))
        currentBtn.setTitle("当前位置", for: UIControlState.normal)
        currentBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        currentBtn.setTitleColor(blackColor, for: UIControlState.normal)
        currentBtn.titleLabel?.font = FONT_15
        currentBtn.addTarget(self, action: #selector(clickCurrentBtn(_:)), for: UIControlEvents.touchUpInside)
        
        let line1 = UIView.init(frame: CGRect.init(x: currentBtn.x, y: currentBtn.maxY, width: currentBtn.width, height: 1))
        line1.backgroundColor = RGB(230, 230, 230)
        
        let terminialLocBtn = UIButton.init(frame: CGRect.init(x: 10 * RATIO_WIDTH, y: currentBtn.maxY + 1, width: SCREEN_WIDTH - 20 * RATIO_WIDTH, height: btnH))
        terminialLocBtn.setTitleColor(RGB(248, 137, 46), for: UIControlState.normal)
        terminialLocBtn.setTitle("您要去哪", for: UIControlState.normal)
        terminialLocBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        terminialLocBtn.titleLabel?.font = FONT_15
        terminialLocBtn.addTarget(self, action: #selector(clickTermiBtn(_:)), for: UIControlEvents.touchUpInside)
        
        let line2 = UIView.init(frame: CGRect.init(x: terminialLocBtn.x, y: terminialLocBtn.maxY, width: terminialLocBtn.width, height: 1))
        line2.backgroundColor = RGB(230, 230, 230)
        
        self.view.addSubview(bgView)
        bgView.addSubview(currentBtn)
        bgView.addSubview(line1)
        bgView.addSubview(terminialLocBtn)
        bgView.addSubview(line2)
    }
    
    // MARK: Action 
    // MARK: ClickBtnAction
    func backUp() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func clickHead(_ btn: UIButton) {
        
    }

    func clickCurrentBtn(_ btn: UIButton) {
        
    }
    
    func clickTermiBtn(_ btn: UIButton) {
        
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
