//
//  SAEvents_SAViewableModule_Tests.m
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
#import "SAViewableModule.h"
#import "SAViewController.h"
#import "SAWebPlayer.h"
#import "SAVideoPlayer.h"

@interface SAEvents_SAViewableModule_Tests : XCTestCase
@property (nonatomic, strong) SAViewController *vc;

@end

@implementation SAEvents_SAViewableModule_Tests

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
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAWebPlayer *view = [[SAWebPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(view);
    XCTAssertNotNil(_vc);
    
    [_vc.view addSubview:view];
    
    SAViewableModule *module = [[SAViewableModule alloc] init];
    
    [module checkViewableImpressionForDisplay:view andResponse:^(BOOL success) {
        XCTAssertTrue(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) test2 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAVideoPlayer *view = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(view);
    XCTAssertNotNil(_vc);
    
    [_vc.view addSubview:view];
    
    SAViewableModule *module = [[SAViewableModule alloc] init];
    
    [module checkViewableImpressionForVideo:view andResponse:^(BOOL success) {
        XCTAssertTrue(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
    
}

- (void) test3 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAVideoPlayer *view = [[SAVideoPlayer alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    
    XCTAssertNotNil(view);
    XCTAssertNotNil(_vc);
    
    [_vc.view addSubview:view];
    
    SAViewableModule *module = [[SAViewableModule alloc] init];
    
    [module checkViewableImpressionForView:view andTicks:10 withResponse:^(BOOL success) {
        XCTAssertTrue(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) test4 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAWebPlayer *view = nil;
    
    XCTAssertNotNil(_vc);
    
    SAViewableModule *module = [[SAViewableModule alloc] init];
    
    [module checkViewableImpressionForDisplay:view andResponse:^(BOOL success) {
        XCTAssertFalse(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
