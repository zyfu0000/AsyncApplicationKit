//
//  AAKViewController.h
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/4.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "AAKNavigationController.h"

@interface AAKViewController : NSObject

@property (nonatomic, strong, readonly) UIViewController *viewController;
@property (nonatomic, strong) ASDisplayNode *node;
@property (nonatomic, weak) AAKNavigationController *navigationController;

- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)animated;
- (void)viewDidAppear:(BOOL)animated;
- (void)viewWillDisappear:(BOOL)animated;
- (void)viewDidDisappear:(BOOL)animated;

@end
