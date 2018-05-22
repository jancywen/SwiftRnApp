//
//  CalendarManagerBridge.m
//  MedicalUnion
//
//  Created by wangwenjie on 2018/5/17.
//  Copyright © 2018年 William_Xue. All rights reserved.
//

#import <Foundation/Foundation.h>


#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(CalendarManager, NSObject)

RCT_EXTERN_METHOD(addEvent:(NSString *)name location:(NSString *)location)

RCT_EXTERN_METHOD(testDateEvent:(NSString *)name location:(NSString *)location date:(nonnull NSNumber *)secondsSinceUnixEpoch)

RCT_EXTERN_METHOD(addEventTwo:(NSString *)name location:(NSString *)location date:(NSString *)ISO8601DateString)

RCT_EXTERN_METHOD(addEventThree:(NSString *)name details:(NSDictionary *)details)

RCT_EXTERN_METHOD(testCallbackEvent:(RCTResponseSenderBlock)callback)

RCT_EXTERN_METHOD(doSomethingExpensive:(NSString *)param callback:(RCTResponseSenderBlock)callback)

@end
