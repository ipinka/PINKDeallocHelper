//
//  PINKDeallocHelper.m
//  PINKDeallocHelper
//
//  Created by Pinka on 2018/12/11.
//  Copyright © 2018年 Pinka. All rights reserved.
//

#import "PINKDeallocHelper.h"
#import <objc/runtime.h>

@interface PINKDeallocHelper ()

@property (copy, nonatomic) PINKDeallocHelperBlock callback;
@property (unsafe_unretained, nonatomic) id target;

@end

@implementation PINKDeallocHelper

+ (void)attachToObject:(nonnull id)object key:(const void*)key whenDeallocDoThis:(PINKDeallocHelperBlock)aThis
{
    if (object) {
        PINKDeallocHelper *tmpHelper = objc_getAssociatedObject(object, key);
        if (!tmpHelper) {
            PINKDeallocHelper *helper = [[PINKDeallocHelper alloc] init];
            helper.target = object;
            helper.callback = aThis;
            objc_setAssociatedObject(object, key, helper, OBJC_ASSOCIATION_RETAIN);
        }
    }
}

+ (void)dettachObject:(nonnull id)object key:(const void*)key
{
    if (object) {
        PINKDeallocHelper *tmpHelper = objc_getAssociatedObject(object, key);
        if (tmpHelper) {
            tmpHelper.target = nil;
        }
        objc_setAssociatedObject(object, key, nil, OBJC_ASSOCIATION_RETAIN);
    }
}

- (void)dealloc
{
    if (_target && _callback) {
        _callback();
    }
}

@end
