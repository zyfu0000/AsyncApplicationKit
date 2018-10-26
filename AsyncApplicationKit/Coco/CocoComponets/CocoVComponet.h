//
//  CocoVComponet.h
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import <ComponentKit/ComponentKit.h>
#import "CocoModel.h"
#import "CocoVHeaderComponet.h"
#import "CocoVFooterComponet.h"
#import "CocoVContentComponet.h"
@interface CocoVComponet : CKCompositeComponent
+(instancetype)newWithModel:(CocoModel *)model context:(id<NSObject>)context;
@end
