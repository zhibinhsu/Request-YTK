//
//  ViewController.m
//  XZBRequest
//
//  Created by Admin on 16/11/9.
//  Copyright © 2016年 Admin. All rights reserved.
//

#import "ViewController.h"
#import "GetuserinfoApi.h"
#import "GTMBase64.h"

@interface ViewController ()<GetuserinfoDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // 拦截uri
    [self getAppCatchUriLogWithMobile:@"13580578583" Uri:@"after" param:@"" appType:@"2" versionName:@"2.1.6" channel:@"" platformName:@"1" businessType:@"0"];
}

// 拦截uri
- (void)getAppCatchUriLogWithMobile:(NSString *)mobile
                                Uri:(NSString *)uri
                              param:(NSString *)param
                            appType:(NSString *)appType
                        versionName:(NSString *)versionName
                            channel:(NSString *)channel
                       platformName:(NSString *)platformName
                       businessType:(NSString *)businessType {
    
    NSDictionary *paramsDic = @{@"mobile":mobile,@"uri":uri,@"param":param,@"appType":appType,@"versionName":versionName,@"channel":channel,@"platformName":platformName,@"businessType":businessType};
   
    
    
    
    
    
    
    
    GetuserinfoApi *api = [[GetuserinfoApi alloc] initWithDic:paramsDic];
    api.requestDelegate = self;
    [api start];
}


// 登录成功
- (void)getuserinfoWithDic:(NSDictionary *)dic
{
    
    
}

// 登录失败
- (void)requestFailedMessage:(NSString *)message
{
   
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
