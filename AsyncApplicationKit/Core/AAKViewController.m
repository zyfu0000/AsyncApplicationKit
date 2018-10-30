//
//  AAKViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/4.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "AAKViewController.h"
#import <Aspects.h>
#import "AAKDispatchQueue.h"
#import <libextobjc/extobjc.h>
#import <JGMethodSwizzler.h>

@interface AAKViewController () <UICollectionViewDelegate>

@property (nonatomic, strong, readwrite) AAKCollectionViewController *vc;

@end

@implementation AAKViewController

//+ (void)load
//{
//    Method method1 = class_getInstanceMethod([self class], @selector(aak_collectionView:layout:sizeForItemAtIndexPath:));
//    IMP imp1 = method_getImplementation(method1);
//    [AAKCollectionViewController
//     swizzleReplaceSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)
//     withIMP:imp1];
    
//    Method method1 = class_getInstanceMethod([self class], @selector(aak_collectionView:layout:sizeForItemAtIndexPath:));
//    IMP imp1 = method_getImplementation(method1);
//    [AAKCollectionViewController
//     swizzleReplaceSelector:@selector(collectionView:layout:sizeForItemAtIndexPath:)
//     withIMP:imp1];
    
//    [RSSwizzle
//     swizzleInstanceMethod:@selector(collectionView:layout:sizeForItemAtIndexPath:)
//     inClass:[AAKCollectionViewController class]
//     newImpFactory:^id(RSSwizzleInfo *swizzleInfo) {
//         return ^CGSize(__unsafe_unretained id self, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath) {
//             return [self aak_collectionView:collectionView
//                                      layout:collectionViewLayout
//                      sizeForItemAtIndexPath:indexPath];
//         };
//     }
//     mode:RSSwizzleModeAlways
//     key:NULL];
//}

- (instancetype)init
{
    self = [super init];
    
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    [flowLayout setMinimumInteritemSpacing:10];
    [flowLayout setMinimumLineSpacing:10];
    self.vc = [[AAKCollectionViewController alloc] initWithCollectionViewLayout:flowLayout];
    __weak AAKViewController *weakThis = self;
    [self.vc
     swizzleMethod:@selector(collectionView:layout:sizeForItemAtIndexPath:)
     withReplacement:JGMethodReplacementProviderBlock {
        return JGMethodReplacement(CGSize, AAKCollectionViewController *, UICollectionView *collectionView, UICollectionViewLayout *collectionViewLayout, NSIndexPath *indexPath) {
            __strong __typeof(weakThis) strongThis = weakThis;
            return [strongThis aak_collectionView:collectionView layout:collectionViewLayout sizeForItemAtIndexPath:indexPath];
        };
    }];
    
    
    
//    @weakify(self);
    
    
    [self.vc
     aspect_hookSelector:@selector(viewDidLoad)
     withOptions:AspectPositionAfter
     usingBlock:^(id<AspectInfo> aspectInfo) {
//         @strongify(self);
//         @weakify(self);
         [AAKDispatchQueue async:^{
//             @strongify(self);
             
             [self viewDidLoad];
         }];
     }
     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewWillAppear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         @strongify(self);
//         @weakify(self);
//         [AAKDispatchQueue async:^{
//             @strongify(self);
//
//             [self viewWillAppear:animated];
//         }];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewDidAppear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         @strongify(self);
//         @weakify(self);
//         [AAKDispatchQueue async:^{
//             @strongify(self);
//
//             [self viewDidAppear:animated];
//         }];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewWillDisappear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         @strongify(self);
//         @weakify(self);
//         [AAKDispatchQueue async:^{
//             @strongify(self);
//
//             [self viewWillDisappear:animated];
//         }];
//     }
//     error:nil];
//    [self.vc
//     aspect_hookSelector:@selector(viewDidDisappear:)
//     withOptions:AspectPositionAfter
//     usingBlock:^(id<AspectInfo> aspectInfo, BOOL animated) {
//         @strongify(self);
//         @weakify(self);
//         [AAKDispatchQueue async:^{
//             @strongify(self);
//
//             [self viewDidDisappear:animated];
//         }];
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

- (CGSize)aak_collectionView:(UICollectionView *)collectionView
                      layout:(UICollectionViewLayout *)collectionViewLayout
      sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeZero;
}

- (void)collectionView:(UICollectionView *)collectionView
       willDisplayCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.dataSource announceWillDisplayCell:cell];
}

- (void)collectionView:(UICollectionView *)collectionView
  didEndDisplayingCell:(UICollectionViewCell *)cell
    forItemAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.dataSource announceDidEndDisplayingCell:cell];
}

@end
