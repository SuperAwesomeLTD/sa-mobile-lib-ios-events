//
//  SAEvents_AllEvents_Test.m
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

@interface SAEvents_AllEvents_Test : XCTestCase
@property (nonatomic, strong) SAAd *ad;
@end

@implementation SAEvents_AllEvents_Test

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

- (void) testSendAllEvents1 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:@"impression" withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendAllEvents2 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:@"err_impression" withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendAllEvents3 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:@"NonExistent" withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendAllEvents4 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:nil withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendAllEvents5 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(_ad);
    XCTAssertNotNil(_ad.creative.events);
    XCTAssertNotNil(event);
    
    // set ad for events
    [event setAd:_ad];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:(NSString*)[NSNull null] withResponse:^(BOOL success, NSInteger status) {
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

- (void) testSendAllEvents7 {
    // given
    SAEvents *event = [[SAEvents alloc] init];
    
    XCTAssertNotNil(event);
    
    // do not set add
    [event setAd:nil];
    
    // now play some events
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    [event sendAllEventsForKey:@"err_impression" withResponse:^(BOOL success, NSInteger status) {
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
