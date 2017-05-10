//
//  SAEvents_SAMoatModule_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 02/03/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAEvents.h"
#import "SAEvents_Aux.h"
#import "SAAd.h"
#import "SACreative.h"
#import "SASession.h"
#import "SAUtils.h"
#import "SAMoatModule.h"
#import "SAViewController.h"
#import "SAVideoPlayer.h"
#import "SAWebPlayer.h"
 #import "SAEvents+Moat.h"

@interface SAEvents_SAMoatModule_Tests : XCTestCase
@property (nonatomic, strong) SAViewController *vc;
@end

@implementation SAEvents_SAMoatModule_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _vc = (SAViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainVC"];
    
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) test1 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    [module disableMoatLimiting];
    
    SAWebPlayer *webView = [[SAWebPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(webView);
    
    [_vc.view addSubview:webView];
    
    NSString *moat = [module startMoatTrackingForDisplay:webView];
    XCTAssertNotNil(moat);
    
    XCTAssertTrue([moat rangeOfString:@"z.moatads.com"].location != NSNotFound);
    XCTAssertTrue([moat rangeOfString:@"superawesomeinappdisplay"].location != NSNotFound);
    XCTAssertTrue([moat rangeOfString:@"731223424656"].location != NSNotFound);
    
    NSInteger loc1 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel1=%ld", ad.advertiserId]].location;
    XCTAssertTrue(loc1 != NSNotFound);
    
    NSInteger loc2 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel2=%ld", ad.campaignId]].location;
    XCTAssertTrue(loc2 != NSNotFound);
    
    NSInteger loc3 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel3=%ld", ad.lineItemId]].location;
    XCTAssertTrue(loc3 != NSNotFound);
    
    NSInteger loc4 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel4=%ld", ad.creative._id]].location;
    XCTAssertTrue(loc4 != NSNotFound);
    
    NSInteger loc5 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer1=%ld", ad.appId]].location;
    XCTAssertTrue(loc5 != NSNotFound);
    
    NSInteger loc6 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer2=%ld", ad.placementId]].location;
    XCTAssertTrue(loc6 != NSNotFound);
    
    NSInteger loc7 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer3=%ld", ad.publisherId]].location;
    XCTAssertTrue(loc7 != NSNotFound);
    
    BOOL stopped = [module stopMoatTrackingForDisplay];
    XCTAssertTrue(stopped);
    
}

- (void) test2 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    [module disableMoatLimiting];
    
    SAWebPlayer *webView = nil;
    
    XCTAssertNotNil(_vc);
    
    NSString *moat = [module startMoatTrackingForDisplay:webView];
    XCTAssertNotNil(moat);
    
    XCTAssertTrue([moat rangeOfString:@"z.moatads.com"].location != NSNotFound);
    XCTAssertTrue([moat rangeOfString:@"superawesomeinappdisplay"].location != NSNotFound);
    XCTAssertTrue([moat rangeOfString:@"731223424656"].location != NSNotFound);
    
    NSInteger loc1 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel1=%ld", ad.advertiserId]].location;
    XCTAssertTrue(loc1 != NSNotFound);
    
    NSInteger loc2 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel2=%ld", ad.campaignId]].location;
    XCTAssertTrue(loc2 != NSNotFound);
    
    NSInteger loc3 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel3=%ld", ad.lineItemId]].location;
    XCTAssertTrue(loc3 != NSNotFound);
    
    NSInteger loc4 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientLevel4=%ld", ad.creative._id]].location;
    XCTAssertTrue(loc4 != NSNotFound);
    
    NSInteger loc5 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer1=%ld", ad.appId]].location;
    XCTAssertTrue(loc5 != NSNotFound);
    
    NSInteger loc6 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer2=%ld", ad.placementId]].location;
    XCTAssertTrue(loc6 != NSNotFound);
    
    NSInteger loc7 = [moat rangeOfString:[NSString stringWithFormat:@"moatClientSlicer3=%ld", ad.publisherId]].location;
    XCTAssertTrue(loc7 != NSNotFound);
    
    BOOL stopped = [module stopMoatTrackingForDisplay];
    XCTAssertTrue(stopped);
    
}

- (void) test3 {
    
    SAAd *ad = nil;
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    [module disableMoatLimiting];
    
    SAWebPlayer *webView = nil;
    
    XCTAssertNotNil(_vc);
    
    NSString *moat = [module startMoatTrackingForDisplay:webView];
    XCTAssertNotNil(moat);
    XCTAssertTrue([moat isEqualToString:@""]);
    
    BOOL stopped = [module stopMoatTrackingForDisplay];
    XCTAssertFalse(stopped);
    
}

- (void) test4 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    [module disableMoatLimiting];
    
    SAVideoPlayer *player = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(player);
    
    [_vc.view addSubview:player];
    
    BOOL moat = [module startMoatTrackingForVideoPlayer:[player getPlayer]
                                              withLayer:[player getPlayerLayer]
                                                andView:player];
    // XCTAssertTrue(moat);
    
    
}

- (void) test5 {
    
    SAAd *ad = nil;
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    [module disableMoatLimiting];
    
    SAVideoPlayer *player = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(player);
    
    [_vc.view addSubview:player];
    
    BOOL moat = [module startMoatTrackingForVideoPlayer:[player getPlayer]
                                              withLayer:[player getPlayerLayer]
                                                andView:player];
    XCTAssertFalse(moat);
}

@end
