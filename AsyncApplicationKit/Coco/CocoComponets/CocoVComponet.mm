//
//  CocoVComponet.m
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import "CocoVComponet.h"

@implementation CocoVComponet
+(instancetype)newWithModel:(CocoModel *)model context:(id<NSObject>)context
{
    CKFlexboxComponent *flex = [CKFlexboxComponent   newWithView:{
                                                                        [UIView class],
                                                                        { {@selector(setBackgroundColor:), [UIColor grayColor]},}
                                                                    }
                                                            size:{}
                                                            style:{
                                                                
                                                                .direction = CKFlexboxDirectionColumn,
                                                                .alignItems = CKFlexboxAlignItemsStretch,
                                                                .spacing = 0
                                                                
                                                            }
                                                        children:{
                                                            
                                                            {
                                                                [CocoVHeaderComponet newWithModel:model context:context]
                                                            },
                                                            {
                                                                [CocoVContentComponet newWithModel:model context:context]
                                                            }
                                                            
                                                        }];
                                
                                return [super newWithComponent:flex];
    
}
@end
