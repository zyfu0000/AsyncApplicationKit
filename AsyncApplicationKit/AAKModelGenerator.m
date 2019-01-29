//
//  AAKModelGenerator.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2019/1/29.
//  Copyright © 2019 Zhiyang Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAKModelGenerator.h"
#import "CocoModel.h"
#import "AAKDispatchQueue.h"

@implementation AAKModelGenerator

+ (RJAsyncClosure)getFirstModels
{
    return ^(RJAsyncCallback callback) {
        NSMutableDictionary *mmDic = [NSMutableDictionary dictionaryWithCapacity:20];
        for (int i=0; i<20; i++) //准备20个测试数据
        {
            NSIndexPath *indexpathi = [NSIndexPath indexPathForRow:i inSection:0];
            
            NSString *ss = [NSString stringWithFormat:@"Cell[%ld]",(long)i];
            CocoModel *coco =[[CocoModel alloc] init];
            coco.name = ss;
            coco.num = i;
            coco.layoutStyle = (myLayoutStyle)(i%3);
            [mmDic setObject:coco forKey:indexpathi];
        }
        
        callback(mmDic, nil);
    };
}

@end
