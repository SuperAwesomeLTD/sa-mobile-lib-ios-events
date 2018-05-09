//
//  SAViewController.m
//  SAEvents
//
//  Created by Gabriel Coman on 03/09/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAVideoPlayer.h"
#import "SAMoatModule.h"
#import "SAAd.h"
#import "SACreative.h"
#import "SANetwork.h"
#import "SAFileDownloader.h"
#import "SAUtils.h"
#import "SAWebPlayer.h"

@interface SAViewController ()
@property (nonatomic, strong) SAVideoPlayer *videoPlayer;
@property (nonatomic, strong) SAWebPlayer *webPlayer;
@property (nonatomic, strong) SAMoatModule *moat;
@end

@implementation SAViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
//    NSString *ua = [SAUtils getUserAgent];
//
//    NSLog(@"%@", ua);
//
//    // get a weak self reference
//    __weak typeof (self) weakSelf = self;
//
//    SAAd *ad = [[SAAd alloc] init];
//    ad.advertiserId = 50;
//    ad.campaignId = 892;
//    ad.lineItemId = 2892;
//    ad.moat = 0.2;
//    ad.creative._id = 2910;
//    ad.appId = 201;
//    ad.placementId = 100;
//    ad.publisherId = 21;
//
//    _moat = [[SAMoatModule alloc] initWithAd:ad];
//    [_moat disableMoatLimiting];
//
//    _videoPlayer = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 240)];
//    [_videoPlayer setEventHandler:^(SAVideoPlayerEvent event, CGFloat time, CGFloat duration) {
//
//        if (event == Video_Start) {
//            BOOL res = [weakSelf.moat startMoatTrackingForVideoPlayer:[weakSelf.videoPlayer getPlayer]
//                                                            withLayer:[weakSelf.videoPlayer getPlayerLayer]
//                                                              andView:weakSelf.videoPlayer];
//            NSLog(@"MOAT START %d", res);
//        }
//        if (event == Video_End) {
//            BOOL res = [weakSelf.moat stopMoatTrackingForVideoPlayer];
//            NSLog(@"MOAT END %d", res);
//        }
//
//    }];
//
//    [[SAFileDownloader getInstance] downloadFileFrom:@"https://sa-beta-ads-video-transcoded-superawesome.netdna-ssl.com/uKCcG2tSUM5mquPclh79M1XMW2XJvPwW.mp4" andResponse:^(BOOL success, NSString *diskPath) {
//
//        NSString *finalDiskURL = [SAUtils filePathInDocuments:diskPath];
//        [weakSelf.videoPlayer playWithMediaFile:finalDiskURL];
//
//    }];
//
//    [self.view addSubview:_videoPlayer];

//    _webPlayer = [[SAWebPlayer alloc] initWithContentSize:CGSizeMake(320, 50) andParentFrame:CGRectMake(0, 240, 320, 50)];
//
//    NSString *moatStr = [_moat startMoatTrackingForDisplay:[_webPlayer getWebView]];
//    NSLog(@"MOAT Str is %@", moatStr);
//    NSString *html = [[NSString alloc] initWithFormat:@"<html><body><img src='https://s3-eu-west-1.amazonaws.com/sb-ads-uploads/images/YkKgkIQYOiwV7WmbHK7jArBjHOrU3Bcn.jpg'>%@</body></html>", moatStr];
//
//    [self.view addSubview:_webPlayer];
//
//    [_webPlayer setEventHandler:^(SAWebPlayerEvent event) {
//        // do nosthing
//    }];
//
//    [_webPlayer loadHTML:html witBase:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
