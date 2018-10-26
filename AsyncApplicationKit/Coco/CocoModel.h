//
//  CocoModel.h
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import <Foundation/Foundation.h>
#define kskDes @"描述文字等等~~"

typedef NS_ENUM(NSUInteger, myLayoutStyle) {
    myLayoutStyleA,
    myLayoutStyleB,
    myLayoutStyleC
};
@interface CocoModel : NSObject
@property(nonatomic,strong) NSString *name;
@property(nonatomic,assign) NSInteger num;
@property(nonatomic,assign) myLayoutStyle layoutStyle;
@end
