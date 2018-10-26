//
//  OtherViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/4.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "FirstViewController.h"
#import "AAKDispatchQueue.h"
#import "SecondViewController.h"
#import <extobjc.h>
#import <KVOController.h>

@interface FirstViewController ()


@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [AAKDispatchQueue async:^{
//        NSDictionary *placeholderAttrs = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:14.0f] , NSForegroundColorAttributeName: [UIColor greenColor] };
//
//        ASButtonNode *button = [[ASButtonNode alloc] init];
//        [button setAttributedTitle:[[NSAttributedString alloc] initWithString:@"button" attributes:placeholderAttrs] forState:UIControlStateNormal];
//        [button addTarget:self action:@selector(action:) forControlEvents:ASControlNodeEventTouchUpInside];
//        [button setFrame:CGRectMake(20, 220, 100, 44)];
//        button.backgroundColor = [UIColor redColor];
//        button.titleNode.displaysAsynchronously = NO;
//
//        dispatch_async(dispatch_get_main_queue(), ^{
//            [self.node addSubnode:button];
//        });
//    }];
}


@end
