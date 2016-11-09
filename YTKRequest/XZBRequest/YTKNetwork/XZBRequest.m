//
//  SoonRequest.m
//  sport
//
//  Created by apple on 15/12/26.
//  Copyright © 2015年 apple. All rights reserved.
//

#import "XZBRequest.h"
#import "NSDate+VRWExtension.h"
#import "NSString+VRWExtension.h"
#import "HttpNetworkingTool.h"

#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]

@implementation XZBRequest

-(id)init
{
    self = [super init];
    if (self) {
        [self.requestAccessories addObject:self];
        [self addAccessory:self];
    }
    return self;
}


-(NSString *)baseUrl
{
    return @"http://192.168.1.207:8082/lbdApp/";
}

-(NSTimeInterval)requestTimeoutInterval
{
    return 20;
}
-(YTKRequestMethod)requestMethod
{
    return YTKRequestMethodGet;
}
- (NSDictionary *)requestHeaderFieldValueDictionary
{
//    NSString* openUDID = [KeychainIDFA IDFA];
    NSDictionary *dic = @{@"clientType":[NSString stringWithFormat:@"IOS"],@"appversion":[NSString stringWithFormat:@"%@",APP_VERSION]};
    return [dic mutableCopy];
}

- (NSString *)requestAuthentication
{
//    NSString *accessToken = USERTEL;
//    if (accessToken.length>0) {
//        return accessToken;
//    }
    
    return nil;
}


-(NSDictionary *)requestTotalArgument
{
    
    NSDictionary *param = self.requestArgument;
    
    NSMutableDictionary *totalParam = [NSMutableDictionary dictionary];
    
    if([[param allKeys] containsObject:@"app_version"] == NO){
        
        [totalParam setObject:APP_VERSION forKey:@"app_version"];
    }
    
    if(param != nil){
       [totalParam  setValuesForKeysWithDictionary:param];
    }
    
    [totalParam setValuesForKeysWithDictionary:[self commonDic]];
   
    return totalParam;
}

NSString *const APP_CURRENT_TIME = @"APP_CURRENT_TIME";//系统时间
NSString *const APP_ID = @"ios-admin";
NSString *const APP_SECRET = @"jOOTehUiXaw9U1fd";

#define NSUSER_DEFAULT [NSUserDefaults standardUserDefaults]
-(NSDictionary *)commonDic
{
    NSInteger sysTime = [NSDate chinaSystemCurrentTime];
    
    NSInteger absTime = [NSUSER_DEFAULT integerForKey:APP_CURRENT_TIME];
    
    sysTime += absTime;
    
    NSString *nowTimeStr = [NSString stringWithFormat:@"%ld",sysTime];

    NSString *url = [[self.requestUrl componentsSeparatedByString:@"/"] lastObject];
    NSString *requestUrl = [NSString stringWithFormat:@"%@\n%@\n%@\n",APP_ID,url,nowTimeStr];
    
    NSString *token =  [NSString hmacsha1:requestUrl key:APP_SECRET];
   
    NSDictionary *dic = @{@"app_id":APP_ID,@"timestamp":nowTimeStr,@"token":token};
    return dic;
}


- (AFConstructingBlock)constructingBodyBlock
{
    return nil;
}


- (void (^)(YTKBaseRequest *))failureCompletionBlock
{
    return ^(YTKBaseRequest *request){
        
        NSInteger responseStatusCode = request.responseStatusCode;
        NSString *responseString = request.responseString;
        if(responseStatusCode == 0){
            
            if([AFNetworkReachabilityManager sharedManager].networkReachabilityStatus == AFNetworkReachabilityStatusNotReachable){
//                [YProgressHUD showToastWithStatus:@"您的网络好像已经断开连接了" duration:3];
            }else{
          
                NSLog(@"网络不给力，请刷新试试...");
            }
            
        }else{

            NSLog(@"服务器异常");
            
        }
    };
}

//-(void (^)(YTKBaseRequest *))successCompletionBlock
//{
//    return ^(YTKBaseRequest *request){
//        
//        id responseJSONObject = request.responseJSONObject;
//        
//    };
//}


@end
