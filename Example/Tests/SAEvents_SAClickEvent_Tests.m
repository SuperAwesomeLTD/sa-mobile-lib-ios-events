//
//  SAEvents_SAClickEvent_Tests.m
//  SAEvents
//
//  Created by Gabriel Coman on 01/03/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAAd.h"
#import "SACreative.h"
#import "SASession.h"
#import "SAClickEvent.h"
#import "SAEvents_Aux.h"
#import "SAUtils.h"

@interface SAEvents_SAClickEvent_Tests : XCTestCase

@end

@implementation SAEvents_SAClickEvent_Tests

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
    SASession *session = [[SASession alloc] init];
    [session setConfigurationStaging];
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    NSString *url = [event getUrl];
    NSString *endpoint = [event getEndpoint];
    NSDictionary *header = [event getHeader];
    NSDictionary *query = [event getQuery];
    
    XCTAssertEqualObjects(url, [session getBaseUrl]);
    XCTAssertEqualObjects(endpoint, @"/video/click");
    
    XCTAssertNotNil(header);
    XCTAssertNotNil([header objectForKey:@"Content-Type"]);
    XCTAssertEqualObjects([header objectForKey:@"Content-Type"], @"application/json");
    XCTAssertNotNil([header objectForKey:@"User-Agent"]);
    XCTAssertEqualObjects([header objectForKey:@"User-Agent"], [SAUtils getUserAgent]);
    
    XCTAssertNotNil(query);
    XCTAssertNotNil([query objectForKey:@"placement"]);
    XCTAssertEqual([[query objectForKey:@"placement"] integerValue], ad.placementId);
    XCTAssertNotNil([query objectForKey:@"bundle"]);
    XCTAssertEqualObjects([query objectForKey:@"bundle"], [session getBundleId]);
    XCTAssertNotNil([query objectForKey:@"creative"]);
    XCTAssertEqual([[query objectForKey:@"creative"] integerValue], ad.creative._id);
    XCTAssertNotNil([query objectForKey:@"line_item"]);
    XCTAssertEqual([[query objectForKey:@"line_item"] integerValue], ad.lineItemId);
    XCTAssertNotNil([query objectForKey:@"ct"]);
    XCTAssertEqual([[query objectForKey:@"ct"] integerValue], [session getConnectivityType]);
    XCTAssertNotNil([query objectForKey:@"sdkVersion"]);
    XCTAssertEqualObjects([query objectForKey:@"sdkVersion"], [session getVersion]);
    XCTAssertNotNil([query objectForKey:@"rnd"]);
    
    
}

- (void) test2 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    SASession *session = nil;
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    NSString *url = [event getUrl];
    NSString *endpoint = [event getEndpoint];
    NSDictionary *header = [event getHeader];
    NSDictionary *query = [event getQuery];
    
    XCTAssertEqualObjects(url, nil);
    XCTAssertEqualObjects(endpoint, @"/video/click");
    
    XCTAssertNotNil(header);
    XCTAssertNotNil([header objectForKey:@"Content-Type"]);
    XCTAssertEqualObjects([header objectForKey:@"Content-Type"], @"application/json");
    XCTAssertNotNil([header objectForKey:@"User-Agent"]);
    XCTAssertEqualObjects([header objectForKey:@"User-Agent"], [SAUtils getUserAgent]);
    
    XCTAssertNotNil(query);
    XCTAssertNil([query objectForKey:@"placement"]);
    XCTAssertNil([query objectForKey:@"bundle"]);
    XCTAssertNil([query objectForKey:@"creative"]);
    XCTAssertNil([query objectForKey:@"line_item"]);
    XCTAssertNil([query objectForKey:@"ct"]);
    XCTAssertNil([query objectForKey:@"sdkVersion"]);
    XCTAssertNil([query objectForKey:@"rnd"]);
    
}

- (void) test3 {
    
    SAAd *ad = nil;
    SASession *session = nil;
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    NSString *url = [event getUrl];
    NSString *endpoint = [event getEndpoint];
    NSDictionary *header = [event getHeader];
    NSDictionary *query = [event getQuery];
    
    XCTAssertEqualObjects(url, nil);
    XCTAssertEqualObjects(endpoint, @"");
    
    XCTAssertNotNil(header);
    XCTAssertNotNil([header objectForKey:@"Content-Type"]);
    XCTAssertEqualObjects([header objectForKey:@"Content-Type"], @"application/json");
    XCTAssertNotNil([header objectForKey:@"User-Agent"]);
    XCTAssertEqualObjects([header objectForKey:@"User-Agent"], [SAUtils getUserAgent]);
    
    XCTAssertNotNil(query);
    XCTAssertNil([query objectForKey:@"placement"]);
    XCTAssertNil([query objectForKey:@"bundle"]);
    XCTAssertNil([query objectForKey:@"creative"]);
    XCTAssertNil([query objectForKey:@"line_item"]);
    XCTAssertNil([query objectForKey:@"ct"]);
    XCTAssertNil([query objectForKey:@"sdkVersion"]);
    XCTAssertNil([query objectForKey:@"rnd"]);

}

- (void) test4 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    SASession *session = [[SASession alloc] init];
    [session setConfigurationStaging];
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    [event triggerEvent:^(BOOL success) {
        XCTAssertTrue(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) test5 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    SASession *session = nil;
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    [event triggerEvent:^(BOOL success) {
        XCTAssertFalse(success);
        [expectation fulfill];
    }];
    
    [self waitForExpectationsWithTimeout:15.0 handler:^(NSError *error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void) test6 {
    
    __block XCTestExpectation *expectation = [self expectationWithDescription:@"High Expectations"];
    
    SAAd *ad = nil;
    SASession *session = nil;
    
    SAClickEvent *event = [[SAClickEvent alloc] initWithAd:ad andSession:session];
    
    [event triggerEvent:^(BOOL success) {
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
