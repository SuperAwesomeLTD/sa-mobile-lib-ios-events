//
//  SAEvents_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 20/10/2016.
//  Copyright © 2016 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAEvents.h"
#import "SAAd.h"
#import "SACreative.h"
#import "SAExtensions.h"
#import "SATracking.h"

@interface SAEvents_Simple_Tests : XCTestCase
@property (nonatomic, strong) SAAd *ad;
@end

@implementation SAEvents_Simple_Tests

- (void)setUp {
    // call to super
    [super setUp];
    
    // setup the ad mock from an already existing json
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test1" ofType:@"json"];
    NSString *json = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    _ad = [[SAAd alloc] initWithJsonString:json];
}

- (void)tearDown {
    [super tearDown];
}

- (void) testSendEvent1 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    NSArray<SATracking*> *tracks = [_ad.creative.events filterBy:@"event" withValue:@"superawesome_impression"];
    SATracking *track = [tracks firstObject];
    
    XCTAssertNotNil(tracks);
    XCTAssertNotNil(track);
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:track.URL withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendEvent2 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    NSArray<SATracking*> *tracks = [_ad.creative.events filterBy:@"event" withValue:@"superawesome_pg_success"];
    SATracking *track = [tracks firstObject];
    
    XCTAssertNotNil(tracks);
    XCTAssertNotNil(track);
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:track.URL withResponse:^(BOOL success, NSInteger status) {
        XCTAssertTrue(success);
        // XCTAssertEqual(status, 200);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) testSendEvent3 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    NSArray<SATracking*> *tracks = [_ad.creative.events filterBy:@"event" withValue:@"vast_firstQuartile"];
    SATracking *track = [tracks firstObject];
    
    XCTAssertNotNil(tracks);
    XCTAssertNotNil(track);
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:track.URL withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendEvent4 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    NSArray<SATracking*> *tracks = [_ad.creative.events filterBy:@"event" withValue:@"NonExistentOne"];
    SATracking *track = [tracks firstObject];
    
    XCTAssertNotNil(tracks);
    XCTAssertNil(track);
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:track.URL withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendEvent5 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:nil withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendEvent6 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendEventToURL:(NSString*)[NSNull null] withResponse:^(BOOL success, NSInteger status) {
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

@end
