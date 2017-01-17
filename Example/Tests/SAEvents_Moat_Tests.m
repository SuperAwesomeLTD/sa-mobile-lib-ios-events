//
//  SAEvents_Moat_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 20/10/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAEvents.h"
#import "SAEvents+Moat.h"
#import "SAViewController.h"
#import "SAAd.h"
#import "SAWebPlayer.h"
#import "SAVideoPlayer.h"

@interface SAEvents_Moat_Tests : XCTestCase
@property (nonatomic, strong) SAViewController *vc;
@property (nonatomic, strong) SAAd *ad;
@end

@implementation SAEvents_Moat_Tests

- (void) setUp {
    // super setup
    [super setUp];
    
    // setup the ad mock from an already existing json
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    _ad = [[SAAd alloc] initWithJsonString:json];
    
    // start a view controller
    _vc = (SAViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainVC"];
}

- (void) tearDown {
    [super tearDown];
}

- (void) testMoat1 {
    // setup
    SAEvents *moatEvt = [[SAEvents alloc] init];
    [moatEvt disableMoatLimiting];
    
    XCTAssertNotNil(_ad);
    
    [moatEvt setAd:_ad];
    
    XCTAssertNotNil(moatEvt);
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    SAWebPlayer *webplayer = [[SAWebPlayer alloc] initWithFrame:CGRectMake(30, 50, 300, 250)];
    
    XCTAssertNotNil(webplayer);
    
    [_vc.view addSubview:webplayer];
    
    NSString *moatString = [moatEvt moatEventForWebPlayer:webplayer];
    
    XCTAssertNotNil(moatString);
    XCTAssertTrue([moatString rangeOfString:@"https://z.moatads.com/"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"superawesomeinappdisplay731223424656"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientLevel1=1"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientLevel2=0"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientLevel3=932"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientLevel4=4907"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientSlicer1=1484"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientSlicer2=481"].location != NSNotFound);
    XCTAssertTrue([moatString rangeOfString:@"moatClientSlicer3=1"].location != NSNotFound);    
}

- (void) testMoat2 {
    // setup
    SAEvents *moatEvt = [[SAEvents alloc] init];
    [moatEvt disableMoatLimiting];
    
    XCTAssertNotNil(_ad);
    
    XCTAssertNotNil(moatEvt);
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    // add a new ad for the viewable impression to work OK
    // [event setAd:_ad];
    
    SAWebPlayer *webplayer = [[SAWebPlayer alloc] initWithFrame:CGRectMake(30, 50, 300, 250)];
    
    XCTAssertNotNil(webplayer);
    
    [_vc.view addSubview:webplayer];
    
    NSString *moatString = [moatEvt moatEventForWebPlayer:webplayer];
    
    XCTAssertNotNil(moatString);
    XCTAssertTrue([moatString isEqualToString:@""]);
}

- (void) testMoat3 {
    // setup
    SAEvents *moatEvt = [[SAEvents alloc] init];
    [moatEvt disableMoatLimiting];
    
    XCTAssertNotNil(_ad);
    
    [moatEvt setAd:_ad];
    
    XCTAssertNotNil(moatEvt);
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    SAVideoPlayer *videoPlayer = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(30, 50, 300, 250)];
    
    XCTAssertNotNil(videoPlayer);
    
    [_vc.view addSubview:videoPlayer];
    
    BOOL moatVideo = [moatEvt moatEventForVideoPlayer:[videoPlayer getPlayer]
                                            withLayer:[videoPlayer getPlayerLayer]
                                              andView:_vc.view];
    
    XCTAssertTrue(moatVideo);
}

@end
