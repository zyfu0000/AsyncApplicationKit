//
//  AAKDispatchQueue.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/5.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "AAKDispatchQueue.h"
#import <YYDispatchQueuePool.h>

@implementation AAKDispatchQueue

+ (void)async:(dispatch_block_t)block
{
    dispatch_queue_t queue = YYDispatchQueueGetForQOS(NSQualityOfServiceUtility);
    dispatch_async(queue, block);
}

+ (void)asyncMain:(dispatch_block_t)block
{
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, block);
}

@end
