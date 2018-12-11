//
//  PINKDeallocHelper.h
//  PINKDeallocHelper
//
//  Created by Pinka on 2018/12/11.
//  Copyright © 2018年 Pinka. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^PINKDeallocHelperBlock)(void);

/**
 It's a helper for observing object dealloc
 */
@interface PINKDeallocHelper : NSObject

/**
 Observing the object when it will dealloc

 @param object the observed object
 @param key unique id
 @param aThis the block will be excuted after the object dealloc
 */
+ (void)attachToObject:(nonnull id)object key:(const void*)key whenDeallocDoThis:(PINKDeallocHelperBlock)aThis;

/**
 Stop observing the object

 @param object the observed object
 @param key unique id
 */
+ (void)dettachObject:(nonnull id)object key:(const void*)key;

@end
