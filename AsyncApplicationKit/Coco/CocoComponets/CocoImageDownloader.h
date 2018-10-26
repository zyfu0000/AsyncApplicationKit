//
//  CocoImageDownloader.h
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import <Foundation/Foundation.h>
#import <ComponentKit/CKNetworkImageDownloading.h>
@interface CocoImageDownloader : NSObject<CKNetworkImageDownloading>
- (id)downloadImageWithURL:(NSURL *)URL
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion;



- (void)cancelImageDownload:(id)download;
@end
