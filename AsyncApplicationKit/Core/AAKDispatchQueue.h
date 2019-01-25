//
//  AAKDispatchQueue.h
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/5.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAKDispatchQueue : NSObject

+ (void)async:(dispatch_block_t)block;
+ (void)asyncMain:(dispatch_block_t)block;
+ (dispatch_queue_t)getDispatchQueue:(NSQualityOfService)qos;

@end

#define AsyncCall(call) \
dispatch_queue_t queue = [AAKDispatchQueue getDispatchQueue:NSQualityOfServiceUtility]; \
dispatch_async(queue, ^{ \
call;\
});\

#define AsyncCallWithCompletion(call, block) \
dispatch_queue_t queue = [AAKDispatchQueue getDispatchQueue:NSQualityOfServiceUtility]; \
dispatch_async(queue, ^{ \
call;\
if (block) { \
block();\
}\
});\
