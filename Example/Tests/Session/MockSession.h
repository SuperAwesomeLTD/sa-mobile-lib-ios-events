//
//  MockSession.h
//  SAEvents_Tests
//
//  Created by Gabriel Coman on 09/05/2018.
//  Copyright © 2018 Gabriel Coman. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SASession.h"

@interface MockSession: SASession
- (NSString*) getUserAgent;
@end
