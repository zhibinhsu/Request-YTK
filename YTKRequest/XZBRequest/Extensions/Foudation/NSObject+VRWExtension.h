//
//  NSObject+VRWExtension.h
//  admin
//
//  Created by zhouzheng on 16/8/2.
//  Copyright © 2016年 Tony. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (VRWExtension)
// 属性列表
@property (nonatomic, readonly, strong) NSArray                *attributeList;

#pragma mark - conversion

// 转换成NSIntger
- (NSInteger)asInteger;
// 转换成float
- (float)asFloat;
// 转换成BOOL
- (BOOL)asBool;
// 转换成NSNumber
- (NSNumber *)asNSNumber;
// 转换成NSString
- (NSString *)asNSString;
// 转换成NSDate
- (NSDate *)asNSDate;
// 转换成NSData
- (NSData *)asNSData;	// TODO
// 转换成NSArray
- (NSArray *)asNSArray;

// 转换成NSNutableArray
- (NSMutableArray *)asNSMutableArray;

// 转换成NSDictionary
- (NSDictionary *)asNSDictionary;
// 转换成NSMutableDictionary
- (NSMutableDictionary *)asNSMutableDictionary;

#pragma mark- associated
//通过runtime的方式进行关联，类似key value的形式，具有内存属性（copy，retain，assign）
- (id)getAssociatedObjectForKey:(const char *)key;
- (id)copyAssociatedObject:(id)obj forKey:(const char *)key;
- (id)retainAssociatedObject:(id)obj forKey:(const char *)key;
- (id)assignAssociatedObject:(id)obj forKey:(const char *)key;
- (void)removeAssociatedObjectForKey:(const char *)key;
- (void)removeAllAssociatedObjects;
@end
