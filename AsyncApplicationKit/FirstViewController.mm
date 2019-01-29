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
#import <ComponentKit/ComponentKit.h>
#import "CocoVComponet.h"
#import "RJIterator.h"
#import "AAKModelGenerator.h"

@interface FirstViewController () <CKComponentProvider>

@property (nonatomic, strong) CKCollectionViewDataSource *dataSource;

@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CKComponentFlexibleSizeRangeProvider *sizeRangeProvider = [CKComponentFlexibleSizeRangeProvider providerWithFlexibility:CKComponentSizeRangeFlexibilityNone];
    CKSizeRange s_range = [sizeRangeProvider sizeRangeForBoundingSize:CGSizeMake(375, 400)];
    //SizeRangeProvider:用来在调整Size的，类似UIKit中的contentSize
    
    id myClsss = [self class];
    //Configuration:用来告诉DataSource谁来提供component，谁来提供size
    CKDataSourceConfiguration *configuration = [[CKDataSourceConfiguration alloc]
                                                initWithComponentProvider:myClsss
                                                context:nil
                                                sizeRange:s_range];
    
    //DataSource: 用来控制整个数据流,所谓数据驱动
    CKCollectionViewDataSource * mDataSource = [[CKCollectionViewDataSource alloc]
                                                initWithCollectionView:self.vc.collectionView
                                                supplementaryViewDataSource:nil
                                                configuration:configuration];
    self.dataSource = mDataSource;
    
//    NSMutableDictionary *mmDic = [NSMutableDictionary dictionaryWithCapacity:20];
//    for (int i=0; i<4; i++) //准备20个测试数据
//    {
//        NSIndexPath *indexpathi =[NSIndexPath indexPathForRow:i inSection:0];
//
//        NSString *ss = [NSString stringWithFormat:@"Cell[%ld]",(long)i];
//        CocoModel *coco =[[CocoModel alloc] init];
//        coco.name = ss;
//        coco.num = i;
//        coco.layoutStyle = (myLayoutStyle)(i%3);
//        [mmDic setObject:coco forKey:indexpathi];
//    }
    
    rj_async(^{
        RJResult *result = rj_await([AAKModelGenerator getFirstModels]);
        NSDictionary *mmDic = result.value;
        
        NSIndexSet *zeroSet = [NSIndexSet indexSetWithIndex:0];
        
        /*
         Changeset:配合DataSource使用的，每次数据有更新会创建新的Changeset，
         Changeset 用来描述增加哪些Cells，删除哪些Cells 还是更新那些Cells,
         然后告诉 DataSource应用Changeset以及使用同步还是异步模式更新。
         相当于[self.collectionView reloadData];
         */
        CKDataSourceChangeset *changeSet = [[[[CKDataSourceChangesetBuilder transactionalComponentDataSourceChangeset] withInsertedSections:zeroSet] withInsertedItems:mmDic] build];
        
        [self.dataSource applyChangeset:changeSet mode:CKUpdateModeAsynchronous userInfo:nil] ;
    });
}

/*
 相当于UIKit中的
 - (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
 告诉ComponentKit 应该显示那个Component
 根据model获取到对应的component
 */
+ (CKComponent *)componentForModel:(CocoModel *)model context:(id<NSObject>)context
{
    return [self getMyComponentForModel:model context:context];
}

#pragma mark - UICollectionViewDelegateFlowLayout

- (CGSize)aak_collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.dataSource sizeForItemAtIndexPath:indexPath];
}
//
//- (void)collectionView:(UICollectionView *)collectionView
//       willDisplayCell:(UICollectionViewCell *)cell
//    forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.dataSource announceWillDisplayCell:cell];
//}
//
//- (void)collectionView:(UICollectionView *)collectionView
//  didEndDisplayingCell:(UICollectionViewCell *)cell
//    forItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    [self.dataSource announceDidEndDisplayingCell:cell];
//}

#pragma mark - 设置model对应的component

+ (CKComponent *)getMyComponentForModel:(CocoModel *)model context:(id<NSObject>)context
{
    switch (model.layoutStyle)
    {
        case myLayoutStyleA:
            return [self getTTLayoutWithModel:model];
            break;
            
        case myLayoutStyleB:
            return [self getTTLayoutWithModel:model];
            break;
            
        case myLayoutStyleC:
            return [self getTTLayoutWithModel:model];
            break;
            
        default:
            return [self getAstyleLayoutWithModel:model];
            break;
    }
    
    return [self getAstyleLayoutWithModel:model];
}

+ (CKComponent *)getTTLayoutWithModel:(CocoModel*)model
{
    
    return [CocoVComponet newWithModel:model context:nil];
    
}

+ (CKComponent *)getAstyleLayoutWithModel:(CocoModel*)model
{
    CKLabelComponent *label = [CKLabelComponent
                               newWithLabelAttributes: {
                                   .string = model.name ,
                                   .font = [UIFont systemFontOfSize:25],
                                   .alignment = NSTextAlignmentCenter
                               }
                               viewAttributes: {
                                   {@selector(setBackgroundColor:),[UIColor blueColor]},
                                   {@selector(setUserInteractionEnabled:),@NO}
                               }
                               size:{.maxWidth = 300,.maxHeight = 30}];
    
    
    
    CKInsetComponent* inset = [CKInsetComponent newWithInsets:{5,5,5,5} component:label];
    
    
    CKFlexboxComponent*layout = [CKFlexboxComponent
                                 newWithView: {
                                     [UIView class],
                                     {
                                         {@selector(setBackgroundColor:), [UIColor orangeColor]},
                                     }
                                 }
                                 size: {}
                                 style: {.direction = CKFlexboxDirectionRow}
                                 children: {
                                     {
                                         inset,
                                         .alignSelf = CKFlexboxAlignSelfCenter
                                     }
                                 }];
    
    return layout;
}

+(CKComponent *)getBstyleLayoutWithModel:(CocoModel*)model
{
    
    
    CKLabelComponent* label1 = [CKLabelComponent
                                newWithLabelAttributes: {
                                    .string = model.name,
                                    .font = [UIFont systemFontOfSize:30]
                                }
                                viewAttributes: {
                                    {@selector(setBackgroundColor:), [UIColor blueColor]},
                                    {@selector(setUserInteractionEnabled:), @NO},
                                }
                                size:{ }];
    
    CKInsetComponent *inset1 = [CKInsetComponent newWithInsets:{5,0,5,0}component:label1];
    
    CKLabelComponent *label2 = [CKLabelComponent
                                newWithLabelAttributes: {
                                    .string = kskDes,
                                    .color = [UIColor blueColor],
                                    .font = [UIFont fontWithName:@"Baskerville" size:20]
                                }
                                viewAttributes: {
                                    {@selector(setBackgroundColor:), [UIColor redColor]},
                                    {@selector(setUserInteractionEnabled:), @NO},
                                }
                                size:{ }];
    CKInsetComponent *inset2 = [CKInsetComponent newWithInsets:{0,0,5,0}component:label2];
    
    CKFlexboxComponent *layout = [CKFlexboxComponent
                                  newWithView: {
                                      [UIView class],
                                      {
                                          {@selector(setBackgroundColor:), [UIColor grayColor]},
                                      }
                                  }
                                  size:{}
                                  style:{.direction = CKFlexboxDirectionColumn}//垂直
                                  children:{
                                      {
                                          inset1,
                                          .alignSelf = CKFlexboxAlignSelfCenter
                                      },
                                      {
                                          inset2,
                                          .alignSelf = CKFlexboxAlignSelfCenter,
                                      }
                                  }];
    
    CKInsetComponent *inset3 = [CKInsetComponent newWithInsets:{0,0,0,0}component:layout];
    
    CKFlexboxComponent *layout2 = [CKFlexboxComponent
                                   newWithView:{
                                       [UIView class],
                                       {
                                           {@selector(setBackgroundColor:), [UIColor purpleColor]},
                                       }
                                   }
                                   size:{}
                                   style:{ .direction = CKFlexboxDirectionColumn}//垂直
                                   children:{
                                       {
                                           inset3,
                                           .alignSelf = CKFlexboxAlignSelfCenter
                                       }
                                   }];
    
    return layout2;
}

+ (CKComponent *)getCstyleLayoutWithModel:(CocoModel*)model
{
    CKLabelComponent *label1 = [CKLabelComponent
                                newWithLabelAttributes:{
                                    .string = model.name,
                                    .font = [UIFont systemFontOfSize:30]
                                }
                                viewAttributes:{
                                    {@selector(setBackgroundColor:), [UIColor blueColor]},
                                    {@selector(setUserInteractionEnabled:), @NO},
                                }
                                size:{ }];
    
    
    CKLabelComponent *label2 = [CKLabelComponent
                                newWithLabelAttributes:{
                                    .string = kskDes,
                                    .color = [UIColor blueColor],
                                    .font = [UIFont fontWithName:@"Baskerville" size:20]
                                }
                                viewAttributes:{
                                    {@selector(setBackgroundColor:), [UIColor redColor]},
                                    {@selector(setUserInteractionEnabled:), @NO},
                                }
                                size:{ }];
    
    CKInsetComponent *inset2 = [CKInsetComponent newWithInsets:{.left = 10} component:label2];
    
    CKFlexboxComponent *layout = [CKFlexboxComponent
                                  newWithView:{
                                      [UIView class],
                                      {  {@selector(setBackgroundColor:), [UIColor grayColor]},}
                                  }
                                  size:{}
                                  style:{ .direction = CKFlexboxDirectionRow}
                                  children:{
                                      {
                                          label1,
                                          .alignSelf = CKFlexboxAlignSelfStart
                                      },
                                      {  inset2,
                                          .alignSelf = CKFlexboxAlignSelfStart,
                                      }
                                  }];
    
    return layout;
}

@end
