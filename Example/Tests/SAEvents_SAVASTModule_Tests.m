//
//  SAEvents_SAVASTModule_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 02/03/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAEvents.h"
#import "SAEvents_Aux.h"
#import "SAAd.h"
#import "SASession.h"
#import "SAVASTModule.h"
#import "SAUtils.h"
#import "SAURLEvent.h"

@interface SAEvents_SAVASTModule_Tests : XCTestCase

@end

@implementation SAEvents_SAVASTModule_Tests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void) test1 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    SAURLEvent *event = module.vastClickThrough;
    
    XCTAssertNotNil(module);
    XCTAssertNotNil(event);
    XCTAssertEqualObjects(event.getUrl, @"https://ads.staging.superawesome.tv/v2/video/click?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=8439823&device=web&country=GB");
    
    NSString *eventUrl = [module getVASTClickThroughEvent];
    XCTAssertNotNil(eventUrl);
    XCTAssertEqualObjects(eventUrl, @"https://ads.staging.superawesome.tv/v2/video/click?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=8439823&device=web&country=GB");
    
}

- (void) test2 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastError;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/error?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=1176843&device=web&country=GB&code=[ERRORCODE]");
    
}

- (void) test3 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastImpression;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/impression?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=1956493&device=web&country=GB");
    
}

- (void) test4 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastClickTracking;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome/v2/2432/click_tracking");
    
}

- (void) test5 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastCreativeView;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=creativeView&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=431411&device=web&country=GB");
    
}

- (void) test6 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastStart;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=start&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=88060&device=web&country=GB");
    
}

- (void) test7 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastFirstQuartile;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=firstQuartile&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=8852120&device=web&country=GB");
    
}

- (void) test8 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastMidpoint;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=midpoint&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=9188166&device=web&country=GB");
    
}

- (void) test9 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastThirdQuartile;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=thirdQuartile&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=3030429&device=web&country=GB");
    
}

- (void) test10 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    NSMutableArray<SAURLEvent*> *list = module.vastComplete;
    
    XCTAssertNotNil(list);
    XCTAssertEqual([list count], 1);
    
    SAURLEvent *event = list[0];
    
    XCTAssertNotNil(event);
    XCTAssertEqualObjects([event getUrl], @"https://ads.staging.superawesome.tv/v2/video/tracking?event=complete&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=3260747&device=web&country=GB");
    
}

- (void) test11 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    XCTAssertNotNil(module);
    XCTAssertNotNil(module.vastClickThrough);
    
    XCTAssertNotNil(module.vastClickTracking);
    XCTAssertEqual([module.vastClickTracking count], 1);
    
    XCTAssertNotNil(module.vastError);
    XCTAssertEqual([module.vastError count], 1);
    
    XCTAssertNotNil(module.vastImpression);
    XCTAssertEqual([module.vastImpression count], 1);
    
    XCTAssertNotNil(module.vastCreativeView);
    XCTAssertEqual([module.vastCreativeView count], 1);
    
    XCTAssertNotNil(module.vastStart);
    XCTAssertEqual([module.vastStart count], 1);
    
    XCTAssertNotNil(module.vastFirstQuartile);
    XCTAssertEqual([module.vastFirstQuartile count], 1);
    
    XCTAssertNotNil(module.vastMidpoint);
    XCTAssertEqual([module.vastMidpoint count], 1);
    
    XCTAssertNotNil(module.vastThirdQuartile);
    XCTAssertEqual([module.vastThirdQuartile count], 1);
    
    XCTAssertNotNil(module.vastComplete);
    XCTAssertEqual([module.vastComplete count], 1);
}

- (void) test12 {
    
    SAAd *ad = nil;
    
    SAVASTModule *module = [[SAVASTModule alloc] initWithAd:ad];
    
    XCTAssertNotNil(module);
    XCTAssertNil(module.vastClickThrough);
    
    XCTAssertNotNil(module.vastClickTracking);
    XCTAssertEqual([module.vastClickTracking count], 0);
    
    XCTAssertNotNil(module.vastError);
    XCTAssertEqual([module.vastError count], 0);
    
    XCTAssertNotNil(module.vastImpression);
    XCTAssertEqual([module.vastImpression count], 0);
    
    XCTAssertNotNil(module.vastCreativeView);
    XCTAssertEqual([module.vastCreativeView count], 0);
    
    XCTAssertNotNil(module.vastStart);
    XCTAssertEqual([module.vastStart count], 0);
    
    XCTAssertNotNil(module.vastFirstQuartile);
    XCTAssertEqual([module.vastFirstQuartile count], 0);
    
    XCTAssertNotNil(module.vastMidpoint);
    XCTAssertEqual([module.vastMidpoint count], 0);
    
    XCTAssertNotNil(module.vastThirdQuartile);
    XCTAssertEqual([module.vastThirdQuartile count], 0);
    
    XCTAssertNotNil(module.vastComplete);
    XCTAssertEqual([module.vastComplete count], 0);
}


@end
