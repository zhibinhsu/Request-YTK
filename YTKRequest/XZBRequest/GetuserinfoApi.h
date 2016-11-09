
//  admin
//
//  Created by XZB on 16/8/15.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "XZBRequest.h"

@protocol GetuserinfoDelegate <NSObject>

@optional

- (void)getuserinfoWithDic:(NSDictionary *)dic;
- (void)requestFailedMessage:(NSString *)message;

@end

@interface GetuserinfoApi : XZBRequest

@property (nonatomic, weak) id <GetuserinfoDelegate>requestDelegate;
- (id)initWithDic:(NSDictionary*)dic;

@end
