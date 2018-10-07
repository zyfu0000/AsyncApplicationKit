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

@end
