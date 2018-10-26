//
//  CocoImageDownloader.m
//  WildeGuess
//
//  Created by biubiublue on 2018/4/12.
//

#import "CocoImageDownloader.h"
#import <UIKit/UIKit.h>
@implementation CocoImageDownloader
- (id)downloadImageWithURL:(NSURL *)URL
                    caller:(id)caller
             callbackQueue:(dispatch_queue_t)callbackQueue
     downloadProgressBlock:(void (^)(CGFloat progress))downloadProgressBlock
                completion:(void (^)(CGImageRef image, NSError *error))completion
{
    
    NSURLSessionDownloadTask *downloadTask = [[NSURLSession sharedSession] downloadTaskWithURL:URL
                                                                             completionHandler:^(NSURL * _Nullable location, NSURLResponse * _Nullable response, NSError * _Nullable error) {
                                                                                 NSData *data = [NSData dataWithContentsOfURL:location];
                                                                                 UIImage *img = [UIImage imageWithData:data];
                                                                                 
                                                                                 dispatch_async(callbackQueue, ^{
                                                                                     completion(img.CGImage,error);
                                                                                 });
        
    }];
    
    [downloadTask resume];
    return downloadTask;
}




- (void)cancelImageDownload:(id)download
{
    [download cancel];
    
}
@end
