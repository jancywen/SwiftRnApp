//
//  RNViewController.swift
//  MedicalUnion
//
//  Created by wangwenjie on 2018/5/16.
//  Copyright © 2018年 William_Xue. All rights reserved.
//

import UIKit
import React


class RNViewController: UIViewController {

    
    let screen_width = UIScreen.main.bounds.size.width
    let screen_height = UIScreen.main.bounds.size.height
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?){
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.configure()
    }
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.configure()
    }
    
    private func configure() {
        
        self.hidesBottomBarWhenPushed = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "测试RN集成"
        self.view.backgroundColor = .white
     
        /*
         // 常规方法
//        var jsCodeLocation: URL?
//        jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
//        let strUrl: String = "http://localhost:8081/index.bundle?platform=ios&dev=true"
        let strUrl: String = "http://192.168.30.21:8081/index.bundle?platform=ios&dev=true"
//        let strUrl: String = "file://" + NSHomeDirectory() + "/Documents/bundles/index.ios.bundle"
        let jsCodeLocation = URL(string: strUrl)
        
        let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "SwiftRnApp", initialProperties: ["ima": "123.jpg"], launchOptions: nil)
        rootView?.backgroundColor = .white
        view = rootView
 */
        
           /*
        // 使用 bridge  依赖
        
        let moduleInitialiser = CalendarManager()
        let bridge = RCTBridge.init(delegate: moduleInitialiser, launchOptions: nil)
        let rootView1 = RCTRootView(bridge: bridge!, moduleName: "SwiftRnApp", initialProperties: nil)
        rootView1?.backgroundColor = .white
        rootView1?.frame = CGRect(x: 0, y: 0, width: screen_width, height: 400)
        self.view.addSubview(rootView1!)

        let btn = UIButton(frame: CGRect(x: 0, y: 400, width: 80, height: 30))
        btn.backgroundColor = UIColor.init(red: 69/255.0, green: 143/255.0, blue: 1.0, alpha: 1.0)
        btn.setTitle("SwiftRnApp", for: .normal)
//        btn.clickButton = {
//            moduleInitialiser.sendMessage()
//        }
        self.view.addSubview(btn)
        
          */
        
       
        /// 加载本地的jsbundle文件
        let strUrl: String = "file://" + NSHomeDirectory() + "/Documents/bundles/index.jsbundle"
        let jsCodeLocation = URL(string: strUrl)
        let rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "SwiftRnApp", initialProperties:nil, launchOptions: nil)
        rootView?.backgroundColor = .white
        view = rootView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

//extension UIButton {
//    var clickButton: () ->Void
//}
