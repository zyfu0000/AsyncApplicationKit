//
//  CocoVHeaderComponet.m
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//
#import <ComponentKit/CKComponentSubclass.h>
#import "CocoVHeaderComponet.h"
#import "CocoImageDownloader.h"
@implementation CocoVHeaderComponet
+(instancetype)newWithModel:(CocoModel *)model context:(id<NSObject>)context
{
    CKComponentScope scope(self);
    NSNumber *state = scope.state();
    
    //头像
    NSString *zhou = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1523548090015&di=f6df282d8f6b8d925021cc5f5500e973&imgtype=0&src=http%3A%2F%2Fimage.uczzd.cn%2F9807540880179100692.jpeg%3Fid%3D0";
    
    NSString *xin = @"http://img1.soyoung.com/post/20141126/1/20141126212349406.png";
    
    NSString *surl = [state boolValue] ? zhou:xin;
    NSURL *sURL = [NSURL URLWithString:surl];
    CKNetworkImageComponent *img = [CKNetworkImageComponent newWithURL:sURL
                                                       imageDownloader:[[CocoImageDownloader alloc]init]
                                                                  size:{60,60}
                                                               options:{}
                                                            attributes:{
                                                                {@selector(setBackgroundColor:),[UIColor redColor]},
                                                                {@selector(setUserInteractionEnabled:),@YES},
                                                                {CKComponentTapGestureAttribute(@selector(didTap))}
                                                            }];
    
    
    //名称
    CKLabelComponent *name = [CKLabelComponent newWithLabelAttributes:{
        
                                                                            .string = model.name,
        .color =[UIColor blackColor],
                                                                            .font = [UIFont systemFontOfSize:15],
                                                                            .alignment = NSTextAlignmentLeft,
                                                                        }
                                                       viewAttributes:{} size:{}];
    //次标题
    CKLabelComponent *subname = [CKLabelComponent newWithLabelAttributes:{
        
        .string = @"次标题",
        .color = [UIColor grayColor],
        .font = [UIFont systemFontOfSize:14],
        .alignment = NSTextAlignmentLeft,
    }
                                                       viewAttributes:{} size:{}];
    
    CKFlexboxComponent *nameBox = [CKFlexboxComponent newWithView:{}
                                                             size:{}
                                                            style:{
                                                                 .direction = CKFlexboxDirectionColumn,
                                                                 .alignItems = CKFlexboxAlignItemsStart
                                                            }
                                                         children:{
                                                             
                                                             {
                                                                 name,
                                                                 .alignSelf = CKFlexboxAlignSelfStretch
                                                             },
                                                             {
                                                                 [CKComponent new],
                                                                 .flexGrow = 2,
                                                                 
                                                             },
                                                             {
                                                                subname,
                                                                .alignSelf = CKFlexboxAlignSelfStretch
                                                             }
                                                             
                                                         }];
    
    
    
    CKInsetComponent *nameInset = [CKInsetComponent newWithInsets:UIEdgeInsetsMake(2, 20, 2, 0) component:nameBox];
    
    
    
    CKFlexboxComponent *flex = [CKFlexboxComponent   newWithView:{
                                                                        [UIView class],
                                                                        {
                                                                            {@selector(setBackgroundColor:), [UIColor orangeColor]},
                                                                        }
                                                                    }
                                                            size:{}
                                                           style:{.direction = CKFlexboxDirectionRow}
                                                        children:{
                                                            {img},
                                                            {
                                                                nameInset,
                                                                .flexGrow = 2,
                                                                .alignSelf = CKFlexboxAlignSelfCenter
                                                            }
                                                        }];
    CKInsetComponent *flesInset = [CKInsetComponent newWithInsets:UIEdgeInsetsMake(20, 0, 20, 0) component:flex];


    return [super newWithComponent:flesInset];
}

+ (id)initialState
{
    return @NO;
}

- (void)didTap
{
    
    NSLog(@"didTap");
    [self updateState:^(NSNumber *oldState){
        return [oldState boolValue] ? @NO : @YES;
    } mode:CKUpdateModeSynchronous];
}

//- (std::vector<CKComponentAnimation>)animationsFromPreviousComponent:(InteractiveQuoteComponent *)previousComponent
//{
//    if (previousComponent->_overlay == nil && _overlay != nil) {
//        return {{_overlay, scaleToAppear()}}; // Scale the overlay in when it appears.
//    } else {
//        return {};
//    }
//}
//
//static CAAnimation *scaleToAppear()
//{
//    CABasicAnimation *scale = [CABasicAnimation animationWithKeyPath:@"transform"];
//    scale.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0, 0.0, 0.0)];
//    scale.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
//    scale.duration = 0.2;
//    return scale;
//}
@end
