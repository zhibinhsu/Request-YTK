//
//  NSData+VRWExtension.h
//  admin
//
//  Created by zhouzheng on 16/8/2.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSData (VRWExtension)

//把NSData转化成 MD5加密的 NSData
@property (nonatomic, readonly, strong) NSData *MD5Data;
//把NSData转化成 MD5加密的 NSString
@property (nonatomic, readonly, copy) NSString *MD5String;
//把NSData转化成 SHA1加密的 NSData
@property (nonatomic, readonly, strong) NSData *SHA1Data;
//把NSData转化成 SHA1加密的 NSString
@property (nonatomic, readonly, copy) NSString *SHA1String;
//把NSData转化成 BASE64Encrypted加密的 NSString
@property (nonatomic, readonly, copy) NSString *BASE64Encrypted;




@end
