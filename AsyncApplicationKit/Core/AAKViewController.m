//
//  AAKViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/4.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "AAKViewController.h"
#import <Aspects.h>

@interface AAKViewController ()


@end

@implementation AAKViewController

- (UIViewController *)viewController
{
    return [UIViewController new];
}

- (instancetype)init
{
    self = [super init];
    
//    self.node = [ASDisplayNode new];
//    self.vc = [[ASViewController alloc] initWithNode:self.node];
//
//    [self.vc
//     aspect_hookSelector:@selector(viewDidLoad)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo) {
//         [self viewDidLoad];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewWillAppear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         [self viewWillAppear:animated];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewDidAppear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         [self viewDidAppear:animated];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewWillDisappear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         [self viewWillDisappear:animated];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewDidDisappear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         [self viewDidDisappear:animated];
//     }
//     error:nil];
    
    return self;
}

- (void)viewDidLoad
{
    
}

- (void)viewWillAppear:(BOOL)animated
{
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    
}

- (void)viewDidDisappear:(BOOL)animated
{
    
}

@end
