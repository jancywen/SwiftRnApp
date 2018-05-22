//
//  CalendarManager.swift
//  MedicalUnion
//
//  Created by wangwenjie on 2018/5/17.
//  Copyright © 2018年 William_Xue. All rights reserved.
//

import UIKit
import React

/// bridge 方法
@objc(CalendarManager)
class CalendarManager: NSObject, RCTBridgeDelegate {
    
    var bridge: RCTBridge!
    
    func sourceURL(for bridge: RCTBridge!) -> URL! {
        self.bridge = bridge
        var jsCodeLocation: URL?
        jsCodeLocation = RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: "index", fallbackResource: nil)
        return jsCodeLocation
    }
    

    /// 普通方法
// @objc(CalendarManager)
// class CalendarManager: NSObject {
    
    /// 发通知更新UI
    ///
    /// - Parameter info:
    func showInfo(_ info: String){
        DispatchQueue.main.async {
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "react-native-test"), object: nil, userInfo: ["info": info])
        }
    }
    
    
    // MARK: - 输出常量
    @objc
    func constantsToExport() -> [String: Any]! {
        return ["someKey": "someValue"]
    }
    
    
    // MARK: - js 调用 原生 方法  - normal
    @objc(addEvent:location:)
    func addEvent(name: String, location: String) -> Void {
        // Date is ready to use!
        print(name)
        print(location)
    }
    
    // MARK: - js 调用 原生 方法  - 时间
    @objc(testDateEvent:location:date:)
    func testDateEvent(name: String, location: String, date: NSNumber){
        
        let d = RCTConvert.nsDate(date)
        print(location)
        print(d)
    }
    
    // MARK: - js 调用 原生 方法  - 时间
    @objc(addEventTwo:location:date:)
    func addEvent(name: String, location: String, date: String) {
        let d = RCTConvert.nsDate(date)
        print(location)
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(for: d)
        
        print(dateString)
    }
    
    // MARK: - js 调用 原生 方法  - 字典
    @objc(addEventThree:details:)
    func addEventThree(name: String, details: Dictionary<String, Any>) {
        let date = RCTConvert.nsDate(details["time"])
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(for: date)
        print(dateString)
    }
    
    // MARK: - js 调用 原生 方法  - 回调
    @objc(testCallbackEvent:)
    func testCallbackEvent(callBack: RCTResponseSenderBlock){
        let events = ["name","张三","age","12"]
        callBack([NSNull(), events])
    }
    
    
    // MARK: - 
    @objc(doSomethingExpensive:callback:)
    func doSomethingExpensive(param:String, callback: @escaping RCTResponseSenderBlock) {
        
        DispatchQueue.global(qos: .default).async {
            
            // 耗时操作
            
            let events = [param]
            
            callback([NSNull(), events])
        }
        
        
    }
    
    // MARK: - promise
    
    // MARK: - 原生 直接用 NativeAppEventEmitter 给 js 发消息
    func sendMessage() {
        
        self.bridge.eventDispatcher().sendAppEvent(withName: "EventReminder", body: ["name": "1234567890"])
//        self.bridge.eventDispatcher().send()
    }
    
  
}
