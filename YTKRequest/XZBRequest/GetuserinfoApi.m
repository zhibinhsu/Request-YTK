
//  admin
//
//  Created by XZB on 16/8/15.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import "GetuserinfoApi.h"

@interface GetuserinfoApi()<YTKRequestDelegate>
@property(nonatomic,copy)NSDictionary *dic;
@end
@implementation GetuserinfoApi
-(id)initWithDic:(NSDictionary *)dic
{
    if (self =[super init]) {
        self.dic = dic;
        self.delegate = self;
    }
    return self;
}

- (NSString *)requestUrl
{
    return @"/appCatchUriLog/createM.json";
}

- (id)requestArgument
{
    return _dic;
}

- (YTKRequestMethod)requestMethod {
    return YTKRequestMethodPost;
}

- (void)requestFinished:(YTKBaseRequest *)request
{
   
    
    
    
    
    id resposeData = [request responseJSONObject];
    
    
    
    
    
    
    if ([resposeData[@"status"] integerValue] == 0) {
        
        NSDictionary *dic = resposeData[@"data"];
        
        
//        VRWUserInfoModel *userModel =  [VRWUserInfoModel mj_objectWithKeyValues:dic];
//        NSString *encryPwdStr = [GTMBase64 encryptWithText:self.dic[@"pwd"]];
//        userModel.password = encryPwdStr;
//        [VRWUserInfoDB saveUserInfo:userModel];
        
        
        if ([self.requestDelegate respondsToSelector:@selector(getuserinfoWithDic:)]) {
            
            [self.requestDelegate getuserinfoWithDic:dic];
        }
        
    } else {
        
        if ([self.requestDelegate respondsToSelector:@selector(requestFailedMessage:)]) {
            
            [self.requestDelegate requestFailedMessage:resposeData[@"msg"]];
        }
    }
}

- (void)requestFailed:(YTKBaseRequest *)request
{
    if ([self.requestDelegate respondsToSelector:@selector(requestFailedMessage:)]) {
        
        [self.requestDelegate requestFailedMessage:@"网络异常..."];
    }

}


@end

