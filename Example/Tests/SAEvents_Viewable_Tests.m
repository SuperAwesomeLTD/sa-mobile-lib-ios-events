//
//  SAEvents_Viewable_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 21/10/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAEvents.h"
#import "SAAd.h"
#import "SACreative.h"
#import "SAExtensions.h"
#import "SATracking.h"
#import "SAViewController.h"

@interface SAEvents_Viewable_Tests : XCTestCase
@property (nonatomic, strong) SAViewController *vc;
@property (nonatomic, strong) SAAd *ad;
@property (nonatomic, strong) NSTimer *viewabilityTimer;
@end

@implementation SAEvents_Viewable_Tests

- (void)setUp {
    // call to super
    [super setUp];
    
    // setup the ad mock from an already existing json
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    _ad = [[SAAd alloc] initWithJsonString:json];
    
    // start a view controller
    _vc = (SAViewController*)[[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"MainVC"];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testViewableImpression1 {
    // assert
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    // create a new view
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 300, 250)];
    [_vc.view addSubview:testView];
    
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // add a new ad for the viewable impression to work OK
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendViewableImpressionForView:testView andTicks:2 withResponse:^(BOOL success, NSInteger status) {
        XCTAssertTrue(success);
        XCTAssertEqual(status, 200);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) testViewableImpression2 {
    // assert
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    // create a new view
    UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(-50, -30, 120, 50)];
    [_vc.view addSubview:testView];
    
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // add a new ad for the viewable impression to work OK
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendViewableImpressionForView:testView andTicks:2 withResponse:^(BOOL success, NSInteger status) {
        XCTAssertFalse(success);
        XCTAssertEqual(status, 0);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) testViewableImpression3 {
    // assert
    XCTAssertNotNil(_vc);
    XCTAssertNotNil(_vc.view);
    
    // create a new view
    __block UIView *testView = [[UIView alloc] initWithFrame:CGRectMake(50, 50, 300, 250)];
    [_vc.view addSubview:testView];
    
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // add a new ad for the viewable impression to work OK
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendViewableImpressionForView:testView andTicks:10 withResponse:^(BOOL success, NSInteger status) {
        XCTAssertFalse(success);
        XCTAssertEqual(status, 0);
        [expectation fulfill];
    }];
    
    // destroy previosus timer, if it exists
    if (_viewabilityTimer != NULL) {
        [_viewabilityTimer invalidate];
        _viewabilityTimer = NULL;
    }
    
    __block NSInteger ticks = 0;
    
    _viewabilityTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:[NSBlockOperation blockOperationWithBlock:^{
        
        ticks++;
        
        NSLog(@"Removal tick %ld", (long)ticks);
        
        // remove the view after 5 ticks!
        if (ticks >= 5) {
            [testView removeFromSuperview];
            testView = nil;
            [_viewabilityTimer invalidate];
            _viewabilityTimer = nil;
            
            NSLog(@"Removed view and invalidated timer!");
        }
        
    }] selector:@selector(main) userInfo:nil repeats:YES];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}


@end
