//
//  SAEvents_SAServerEvent_Tests.m
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
#import "SAServerEvent.h"
#import "SAUtils.h"

@interface SAEvents_SAServerEvent_Tests : XCTestCase

@end

@implementation SAEvents_SAServerEvent_Tests

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
    
    SAServerEvent *event = [[SAServerEvent alloc] initWithAd:ad andSession:session];
    
    NSString *url = [event getUrl];
    NSString *endpoint = [event getEndpoint];
    NSDictionary *header = [event getHeader];
    NSDictionary *query = [event getQuery];
    
    XCTAssertEqualObjects(url, [session getBaseUrl]);
    XCTAssertEqualObjects(endpoint, @"");
    
    XCTAssertNotNil(header);
    XCTAssertNotNil([header objectForKey:@"Content-Type"]);
    XCTAssertEqualObjects([header objectForKey:@"Content-Type"], @"application/json");
    XCTAssertNotNil([header objectForKey:@"User-Agent"]);
    XCTAssertEqualObjects([header objectForKey:@"User-Agent"], [SAUtils getUserAgent]);
    
    XCTAssertNotNil(query);
    
}

- (void) test2 {
    
    SAAd *ad = nil;
    SASession *session = [[SASession alloc] init];
    [session setConfigurationStaging];
    
    SAServerEvent *event = [[SAServerEvent alloc] initWithAd:ad andSession:session];
    
    NSString *url = [event getUrl];
    NSString *endpoint = [event getEndpoint];
    NSDictionary *header = [event getHeader];
    NSDictionary *query = [event getQuery];
    
    XCTAssertEqualObjects(url, [session getBaseUrl]);
    XCTAssertEqualObjects(endpoint, @"");
    
    XCTAssertNotNil(header);
    XCTAssertNotNil([header objectForKey:@"Content-Type"]);
    XCTAssertEqualObjects([header objectForKey:@"Content-Type"], @"application/json");
    XCTAssertNotNil([header objectForKey:@"User-Agent"]);
    XCTAssertEqualObjects([header objectForKey:@"User-Agent"], [SAUtils getUserAgent]);
    
    XCTAssertNotNil(query);
    
}

- (void) test3 {
    
    SAAd *ad = nil;
    SASession *session = nil;
    
    SAServerEvent *event = [[SAServerEvent alloc] initWithAd:ad andSession:session];
    
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
    
}

@end
