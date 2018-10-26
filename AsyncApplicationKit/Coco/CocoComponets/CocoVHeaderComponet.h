//
//  CocoVHeaderComponet.h
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import <ComponentKit/ComponentKit.h>
#import "CocoModel.h"
@interface CocoVHeaderComponet : CKCompositeComponent
+(instancetype)newWithModel:(CocoModel *)model context:(id<NSObject>)context;
@end
