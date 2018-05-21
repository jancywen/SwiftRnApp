//
//  ViewController.swift
//  SwiftRnApp
//
//  Created by wangwenjie on 2018/5/16.
//  Copyright © 2018年 Roo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_action(_ sender: Any) {
        self.navigationController?.pushViewController(RNViewController(), animated: true)
    }
    
}

