//
//  CocoVContentComponet.m
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//
#define kRandomNum (arc4random()%255/255.0f)
#define kRandomColor [UIColor colorWithRed:kRandomNum green:kRandomNum blue:kRandomNum alpha:1]

#import "CocoVContentComponet.h"
#import "CocoImageDownloader.h"
@implementation CocoVContentComponet
+(instancetype)newWithModel:(CocoModel *)model context:(id<NSObject>)context
{
    
    NSString *surl = @"http://img1.soyoung.com/post/20141126/1/20141126212349406.png";

    
    std::vector<CKFlexboxComponentChild> childline;
    std::vector<CKFlexboxComponentChild> childrow;
    
    NSInteger numberofline = 0;
    
    for (int i=0; i<9; i++)
    {
        NSInteger currentline = i/3;
        
        if (currentline>numberofline)
        {
            
            childline.push_back([CocoVContentComponet stackRowComponet:childrow]);
            childrow = std::vector<CKFlexboxComponentChild>();//新起一行
            numberofline = currentline;
        }
        
        NSString *s = i%2==0?surl:nil;
        CKComponent *c = [CocoVContentComponet imgComponentWithURLStr:s];
        childrow.push_back({.component = c});
        
    }
    
     childline.push_back([CocoVContentComponet stackRowComponet:childrow]);
    
    CKFlexboxComponent *line = [CKFlexboxComponent newWithView:{
        [UIView class],
        {
            {@selector(setBackgroundColor:), [UIColor orangeColor]},
        }
    }
                                                        size:{}
                                                       style:{
                                                           .direction = CKFlexboxDirectionColumn,
                                                            .alignItems = CKFlexboxAlignItemsCenter
                                                       }
                                                    children:childline];
    CKInsetComponent *inset = [CKInsetComponent newWithInsets:UIEdgeInsetsMake(0, 0, 0, 0) component:line];
    
    return [super newWithComponent:inset];

}

+(CKFlexboxComponentChild)stackRowComponet:(std::vector<CKFlexboxComponentChild>)rowArr
{
    CKFlexboxComponent *c = [CKFlexboxComponent newWithView:{}
                                                     size:{
                                                         .height = 100
                                                     }
                                                    style:{
                                                        .direction = CKFlexboxDirectionRow,
                                                         .alignItems = CKFlexboxAlignItemsStretch
                                                    }
                                                 children:rowArr];
    
    CKFlexboxComponentChild cWrap = {.component = c};
    
    return cWrap;
}


+(CKComponent*)imgComponentWithURLStr:(NSString *)urlString
{
    
    //头像
   // NSString *surl = @"http://img1.soyoung.com/post/20141126/1/20141126212349406.png";
    NSURL *sURL = [NSURL URLWithString:urlString];
    CKNetworkImageComponent *img = [CKNetworkImageComponent newWithURL:sURL
                                                       imageDownloader:[[CocoImageDownloader alloc]init]
                                                                  size:{100,100}
                                                               options:{}
                                                            attributes:{
                                                                {@selector(setBackgroundColor:),kRandomColor}
                                                                
                                                            }];
    
    return img;
}




@end
