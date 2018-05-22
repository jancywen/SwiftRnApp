//
//  ViewController.swift
//  SwiftRnApp
//
//  Created by wangwenjie on 2018/5/16.
//  Copyright © 2018年 Roo. All rights reserved.
//

import UIKit
import Zip

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        unZipFile()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btn_action(_ sender: Any) {
        self.navigationController?.pushViewController(RNViewController(), animated: true)
    }
    
}

extension ViewController {
    fileprivate func unZipFile() {
        // 测试解压工程内的zip文件保存到沙盒内
        // 沙盒路径: let strUrl: String = "file://" + NSHomeDirectory() + "/Documents"
        
        do {
            if let filePath = Bundle.main.url(forResource: "bundles", withExtension: "zip") {
        
                let documentsDirectory = FileManager.default.urls(for:.documentDirectory, in: .userDomainMask)[0]
                try Zip.unzipFile(filePath, destination: documentsDirectory, overwrite: true, password: nil, progress: { (progress) -> () in
                    print(progress)
                })
            }
        }
        catch {
            print("Something went wrong")
        }
        
    }
}
