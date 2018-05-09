//
//  MockSession.m
//  SAEvents_Tests
//
//  Created by Gabriel Coman on 09/05/2018.
//  Copyright © 2018 Gabriel Coman. All rights reserved.
//

#import "MockSession.h"

@implementation MockSession

- (id) init {
    if (self = [super init]) {
        // do nothing
    }
    
    return self;
}

- (NSString*) getVersion {
    return @"1.0.0";
}

- (NSInteger) getCachebuster {
    return 123456;
}

- (NSString*) getUserAgent {
    return @"some-user-agent";
}

- (NSString*) getDevice {
    return @"phone";
}

- (NSString*) getLang {
    return @"en_US";
}

- (NSString*) getAppName {
    return @"MyApp";
}

- (NSString*) getBaseUrl {
    return @"http://localhost:64000";
}

- (NSString*) getBundleId {
    return @"superawesome.tv.saadloaderdemo";
}

- (NSUInteger) getDauId {
    return 654321;
}

- (BOOL) getTestMode {
    return false;
}

- (NSInteger) getConnectivityType {
    return 2;
}

@end
