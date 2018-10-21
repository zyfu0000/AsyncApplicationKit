//
//  OtherViewController.m
//  AsyncApplicationKit
//
//  Created by Zhiyang Fu on 2018/10/4.
//  Copyright © 2018 Zhiyang Fu. All rights reserved.
//

#import "FirstViewController.h"
#import "AAKDispatchQueue.h"
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "SecondViewController.h"
#import <AVFoundation/AVFoundation.h>
#import <extobjc.h>
#import "AVPlayerItem+MCCacheSupport.h"
#import <KVOController.h>
#import <VIResourceLoaderManager.h>
#import <VICacheManager.h>

@interface FirstViewController ()

@property (nonatomic, strong) AVPlayer *player;

@property (nonatomic, strong) AVQueuePlayer *queuePlayer;
@property (nonatomic, strong) AVPlayerLooper *playerLooper;

@property (nonatomic, strong) VIResourceLoaderManager *resourceLoaderManager;


@end

@implementation FirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [AAKDispatchQueue async:^{
        NSDictionary *placeholderAttrs = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-LightItalic" size:14.0f] , NSForegroundColorAttributeName: [UIColor greenColor] };
        
        ASButtonNode *button = [[ASButtonNode alloc] init];
        [button setAttributedTitle:[[NSAttributedString alloc] initWithString:@"button" attributes:placeholderAttrs] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(action:) forControlEvents:ASControlNodeEventTouchUpInside];
        [button setFrame:CGRectMake(20, 220, 100, 44)];
        button.backgroundColor = [UIColor redColor];
        button.titleNode.displaysAsynchronously = NO;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.node addSubnode:button];
        });
    }];
}

- (void)action:(id)sender
{
//    [AAKDispatchQueue async:^{
//        SecondViewController *vc = [SecondViewController new];
//        [self.navigationController pushViewController:vc animated:YES];
//    }];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
    NSURL *url = [NSURL URLWithString:@"http://ws.stream.qqmusic.qq.com/C1000015H75B1NvYzl.m4a?fromtag=0&guid=126548449"];
    
//
//        AVPlayerItem *playerItem = [AVPlayerItem mc_playerItemWithRemoteURL:url error:nil];
//
//        [AVPlayerItem mc_removeCacheWithCacheFilePath:playerItem.mc_cacheFilePath];
    
    
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithURL:url];
    
    if (@available(iOS 10.0, *)) {
        playerItem.preferredForwardBufferDuration = 1;
        
    } else {
        // Fallback on earlier versions
    }

    playerItem.canUseNetworkResourcesForLiveStreamingWhilePaused = NO;
    [playerItem seekToTime:CMTimeMake(95, 1)];
    playerItem.forwardPlaybackEndTime = CMTimeMake(98, 1);



    self.player = [AVPlayer playerWithPlayerItem:playerItem];
    
    self.player.automaticallyWaitsToMinimizeStalling = NO;

//    [self.player playImmediatelyAtRate:0.3];
    
    
    
    
    
    
//    AVPlayerItem *item = [AVPlayerItem mc_playerItemWithRemoteURL:url error:nil];
//
//    [AVPlayerItem mc_removeCacheWithCacheFilePath:item.mc_cacheFilePath];
//
//            if (@available(iOS 10.0, *)) {
//                   item.preferredForwardBufferDuration = 1;
//               } else {
//                       // Fallback on earlier versions
//                   }
//
//            self.player = [AVPlayer playerWithPlayerItem:item];
//
//            self.player = [AVPlayer playerWithURL:url];
////
////
//    // kvo 问题 todo
//    @weakify(self);
//    [self.KVOController
//     observe:self.player.currentItem
//     keyPath:@"status"
//     options:0
//     block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//         @strongify(self);
//         if (self.player.currentItem.status == AVPlayerItemStatusReadyToPlay) {
//             //[01:28.97]伤人的爱不堪回首
//             //[01:35.29]慢慢慢慢没有感觉
//             //[01:38.90]慢慢慢慢我被忽略
//             // 从1：35开始播
//
//
//             float fps = [[[self.player.currentItem.asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] nominalFrameRate];
////             [self.player seekToTime:CMTimeMakeWithSeconds(95.29, fps)];
//
//             self.player.currentItem.forwardPlaybackEndTime = CMTimeMakeWithSeconds(98.29, fps);
//
//             [self.player play];
//         }
//     }];
//
//    [self.KVOController
//     observe:self.player.currentItem
//     keyPath:@"loadedTimeRanges"
//     options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionInitial
//     block:^(id  _Nullable observer, id  _Nonnull object, NSDictionary<NSString *,id> * _Nonnull change) {
//         NSArray *timeRanges = change[NSKeyValueChangeNewKey];
//         if (timeRanges.count > 0) {
//             NSTimeInterval start = CMTimeGetSeconds([timeRanges[0] CMTimeRangeValue].start);
//             NSTimeInterval end = CMTimeGetSeconds(CMTimeAdd([timeRanges[0] CMTimeRangeValue].start, [timeRanges[0] CMTimeRangeValue].duration));
//             NSLog(@"时间到1, start: %@ end: %@", @(start), @(end));
//             if (start > 0 && end > 98.0) {
//                 NSLog(@"时间到2");
//
//                 [self.player.currentItem cancelPendingSeeks];
//                 [self.player.currentItem.asset cancelLoading];
//
////                 [self.player play];
//             }
//         }
//     }];
    
    
            // 必须持有playerObserver，否则不会生效
//        self.playerObserver = [self.player addBoundaryTimeObserverForTimes:@[[NSValue valueWithCMTime:CMTimeMakeWithSeconds(98.90, 1.000)]] queue:NULL usingBlock:^{
//                           // 1：38停止
//                           //[01:28.97]伤人的爱不堪回首
//                           //[01:35.29]慢慢慢慢没有感觉
//                           //[01:38.90]慢慢慢慢我被忽略
//                           strongify(self);
//                           [self.player pause];
//                       }];
    
    
    
    
    
    
//    NSURL *url = [NSURL URLWithString:@"http://ws.stream.qqmusic.qq.com/C1000015H75B1NvYzl.m4a?fromtag=0&guid=126548449"];
//
//
//    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:url options:nil];
//    NSArray *keys = @[@"duration", @"tracks"];
////    NSArray *keys = @[@"availableMetadataFormats"];
//
//    [asset loadValuesAsynchronouslyForKeys:keys completionHandler:^()
//     {
//         // make sure everything downloaded properly
//         BOOL allLoaded = YES;
//         for (NSString *key in keys) {
//             if ([asset statusOfValueForKey:key error:nil] != AVKeyValueStatusLoaded) {
//                 allLoaded = NO;
//                 break;
//             }
//         }
//
//         if (allLoaded) {
//             float fps = [[[asset tracksWithMediaType:AVMediaTypeAudio] objectAtIndex:0] nominalFrameRate];
//             AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
//             self.queuePlayer = [AVQueuePlayer queuePlayerWithItems:@[playerItem]];
//             self.playerLooper = [AVPlayerLooper playerLooperWithPlayer:self.queuePlayer templateItem:playerItem timeRange:CMTimeRangeMake(CMTimeMakeWithSeconds(95.29, fps), CMTimeMakeWithSeconds(98.29, fps))];
//             [self.queuePlayer play];
//         }
    

//         for (AVAssetTrack *track in asset.tracks) {
//             [track loadValuesAsynchronouslyForKeys:@[@"segments"] completionHandler:^{
//
//                 for (AVAssetTrackSegment *segment in track.segments) {
//                     CMTimeMapping timeMapping = segment.timeMapping;
//                     NSLog(@"segment: %@, %@, %@, %@",  @(CMTimeGetSeconds(timeMapping.source.start)), @(CMTimeGetSeconds(timeMapping.source.duration)),@(CMTimeGetSeconds(timeMapping.target.start)), @(CMTimeGetSeconds(timeMapping.target.duration)));
//                 }
//             }];
//         }

         //            AVPlayerItem *item = [[AVPlayerItem alloc] initWithAsset:asset];
         //
         //            dispatch_async(dispatch_get_main_queue(), ^ {
         //                //[player insertItem:item afterItem:nil];
         //                NSLog(@"finished download");
         //                [self.player replaceCurrentItemWithPlayerItem:item];
         //                [self.player play];
         //
         //            });

//     }];
    
    
//    NSURL *url = [NSURL URLWithString:@"http://ws.stream.qqmusic.qq.com/C1000015H75B1NvYzl.m4a?fromtag=0&guid=126548449"];
//    AVPlayerItem *item = [AVPlayerItem playerItemWithURL:url];
//    self.player = [AVPlayer playerWithPlayerItem:item];
//
//    [item addObserver:self
//           forKeyPath:@"timedMetadata"
//              options:NSKeyValueObservingOptionInitial | NSKeyValueObservingOptionNew
//              context:nil];
//
//    [self.player play];
    
    return;
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context
{
    id value = change[NSKeyValueChangeNewKey];
    
    NSLog(@"timedMeta: %@", value);
}

@end
