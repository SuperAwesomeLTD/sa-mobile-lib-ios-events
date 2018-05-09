//
//  TestSAServerModule.m
//  SAEvents_Tests
//
//  Created by Gabriel Coman on 09/05/2018.
//  Copyright © 2018 Gabriel Coman. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "SAModelFactory.h"
#import "SAServerModule.h"
#import "SASession.h"
#import "MockSession.h"
#import "SAMockEventsServer.h"

@interface TestSAServerModule : XCTestCase
@property (nonatomic, strong) SAMockEventsServer *server;
@end

@implementation TestSAServerModule

- (void)setUp {
    [super setUp];
    _server = [[SAMockEventsServer alloc] init];
    [_server start];
}

- (void)tearDown {
    [_server shutdown];
    _server = nil;
    [super tearDown];
}

@end
