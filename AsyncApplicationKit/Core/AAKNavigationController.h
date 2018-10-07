//
//  AAKNavigationController.h
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/5.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AAKViewController;

@interface AAKNavigationController : NSObject

@property (nonatomic, strong) UINavigationController *navigationController;

- (instancetype)initWithRootViewController:(AAKViewController *)rootViewController;
- (void)pushViewController:(AAKViewController *)viewController animated:(BOOL)animated;
- (AAKViewController *)popViewControllerAnimated:(BOOL)animated;

@end
