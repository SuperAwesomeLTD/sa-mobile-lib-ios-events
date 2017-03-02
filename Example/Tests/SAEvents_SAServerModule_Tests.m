//
//  SAEvents_SAServerModule_Tests.m
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
#import "SAServerModule.h"

@interface SAEvents_SAServerModule_Tests : XCTestCase

@end

@implementation SAEvents_SAServerModule_Tests

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
    
    SAServerModule *module = [[SAServerModule alloc] initWithAd:ad andSession:session];
    
    XCTAssertNotNil(module.clickEvent);
    XCTAssertNotNil(module.impressionEvent);
    XCTAssertNotNil(module.viewableImpressionEvent);
    XCTAssertNotNil(module.pgCloseEvent);
    XCTAssertNotNil(module.pgFailEvent);
    XCTAssertNotNil(module.pgOpenEvent);
    XCTAssertNotNil(module.pgSuccessEvent);
    
}

- (void) test2 {
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    SASession *session = nil;
    
    SAServerModule *module = [[SAServerModule alloc] initWithAd:ad andSession:session];
    
    XCTAssertNotNil(module.clickEvent);
    XCTAssertNotNil(module.impressionEvent);
    XCTAssertNotNil(module.viewableImpressionEvent);
    XCTAssertNotNil(module.pgCloseEvent);
    XCTAssertNotNil(module.pgFailEvent);
    XCTAssertNotNil(module.pgOpenEvent);
    XCTAssertNotNil(module.pgSuccessEvent);
    
}

- (void) test3 {
    
    SAAd *ad = nil;
    SASession *session = nil;
    
    SAServerModule *module = [[SAServerModule alloc] initWithAd:ad andSession:session];
    
    XCTAssertNotNil(module.clickEvent);
    XCTAssertNotNil(module.impressionEvent);
    XCTAssertNotNil(module.viewableImpressionEvent);
    XCTAssertNotNil(module.pgCloseEvent);
    XCTAssertNotNil(module.pgFailEvent);
    XCTAssertNotNil(module.pgOpenEvent);
    XCTAssertNotNil(module.pgSuccessEvent);
    
}


@end
