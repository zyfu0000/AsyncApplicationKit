//
//  SecondViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/7.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "SecondViewController.h"
#import "AAKDispatchQueue.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [AAKDispatchQueue async:^{
        NSDictionary *placeholderAttrs = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:14.0f] , NSForegroundColorAttributeName: [UIColor greenColor] };
        
        ASButtonNode *button = [[ASButtonNode alloc] init];
        [button setAttributedTitle:[[NSAttributedString alloc] initWithString:@"返回" attributes:placeholderAttrs] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(action:) forControlEvents:ASControlNodeEventTouchUpInside];
        [button setFrame:CGRectMake(20, 20, 100, 44)];
        button.backgroundColor = [UIColor redColor];
        button.titleNode.displaysAsynchronously = NO;
        [self.node addSubnode:button];
    }];
}

- (void)action:(id)sender
{
    [AAKDispatchQueue async:^{
        SecondViewController *vc = [SecondViewController new];
        [self.navigationController pushViewController:vc animated:YES];
    }];
}

@end
