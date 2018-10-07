//
//  AAKNavigationController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/5.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AAKNavigationController.h"
#import "AAKDispatchQueue.h"
#import "AAKViewController.h"

@interface AAKNavigationController ()

@property (nonatomic, strong) NSMutableArray *vcs;

@end

@implementation AAKNavigationController

- (NSMutableArray *)vcs
{
    if (!_vcs) {
        _vcs = [NSMutableArray array];
    }
    return _vcs;
}

- (instancetype)initWithRootViewController:(AAKViewController *)rootViewController
{
    self = [super init];
    
    self.navigationController = [[UINavigationController alloc] initWithRootViewController:rootViewController.viewController];
    
    rootViewController.navigationController = self;
    
    [self.vcs addObject:rootViewController];
    
    return self;
}

- (void)pushViewController:(AAKViewController *)viewController animated:(BOOL)animated
{
    viewController.navigationController = self;
    [self.vcs addObject:viewController];
    
    [AAKDispatchQueue asyncMain:^{
        [self.navigationController pushViewController:viewController.viewController animated:animated];
    }];
}

- (AAKViewController *)popViewControllerAnimated:(BOOL)animated
{
    AAKViewController *vc = [self.vcs lastObject];
    [self.vcs removeObject:vc];
    
    [AAKDispatchQueue asyncMain:^{
        [self.navigationController pushViewController:vc.viewController animated:animated];
    }];
    
    return vc;
}

@end
