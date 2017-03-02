//
//  SAEvents_SAEvents_Tests.m
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

@interface SAEvents_SAEvents_Tests : XCTestCase

@end

@implementation SAEvents_SAEvents_Tests

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
    
    SAEvents *events = [[SAEvents alloc] init];
    [events setAd:ad andSession:session];
    
    XCTAssertNotNil(events.serverModule);
    XCTAssertNotNil(events.moatModule);
    XCTAssertNotNil(events.vastModule);
    XCTAssertNotNil(events.viewableModule);
    
    [events unsetAd];
    
    XCTAssertNil(events.serverModule);
    XCTAssertNil(events.moatModule);
    XCTAssertNil(events.vastModule);
    XCTAssertNil(events.viewableModule);
    
}

@end
