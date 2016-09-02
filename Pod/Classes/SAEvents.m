//
//  SAEvents.m
//  Pods
//
//  Created by Gabriel Coman on 26/02/2016.
//
//

#import "SAEvents.h"
#import "SAUtils.h"
#import "SANetwork.h"
#import "SAExtensions.h"
#import "SAAd.h"
#import "SADetails.h"
#import "SACreative.h"
#import "SAMedia.h"
#import "SATracking.h"

// try to import moat
#if defined(__has_include)
#if __has_include("SAEvents+Moat.h")
#import "SAEvents+Moat.h"
#endif
#endif

#define MAX_TICKS 2

@interface SAEvents ()
@property (nonatomic, strong) SAAd *ad;
@property (nonatomic, strong) NSTimer *viewabilityTimer;
@end

@implementation SAEvents

- (void) setAd:(SAAd *)ad {
    _ad = ad;
}

////////////////////////////////////////////////////////////////////////////////
// MARK: Normal events
////////////////////////////////////////////////////////////////////////////////

- (void) sendEventToURL:(NSString *)url {
    SANetwork *network = [[SANetwork alloc] init];
    [network sendGET:url
           withQuery:@{}
           andHeader:@{@"Content-Type":@"application/json",
                       @"User-Agent":[SAUtils getUserAgent]}
        withResponse:^(NSInteger status, NSString *payload, BOOL success) {
            if (success) {
                NSLog(@"Event sent OK!");
            } else {
                NSLog(@"Event sent NOK!");
            }
        }];
}

- (void) sendAllEventsForKey:(NSString*)key {
    // safety check
    if (_ad == NULL) return;
    
    // get the necessary events
    NSArray *tracks = [_ad.creative.events filterBy:@"event" withValue:key];
    NSMutableArray *urls = [@[] mutableCopy];
    for (id track in tracks) {
        NSString *url = [track valueForKey:@"URL"];
        if (url) {
            [urls addObject:url];
        }
    }
    
    // send events
    for (NSString *url in urls) {
        [self sendEventToURL:url];
    }
}

////////////////////////////////////////////////////////////////////////////////
// MARK: Viewable Impression
////////////////////////////////////////////////////////////////////////////////

- (void) sendViewableForFullscreen {
    // safety check
    if (_ad == NULL) return;
    
    // start timer
    __block NSInteger ticks = 0;
    _viewabilityTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:[NSBlockOperation blockOperationWithBlock:^{
        
        if (ticks >= MAX_TICKS) {
            [_viewabilityTimer invalidate];
            _viewabilityTimer = nil;
            [self sendAllEventsForKey:@"viewable_impr"];
        } else {
            ticks++;
            NSLog(@"[AA :: Info] Tick %ld/%d", (long)ticks, MAX_TICKS);
        }
        
    }] selector:@selector(main) userInfo:nil repeats:YES];
    
    // fire timer
    [_viewabilityTimer fire];
    
}

- (void) sendViewableForInScreen:(UIView *)view {
    
    // safety check
    if (_ad == NULL) return;
    
    // start timer
    __block NSInteger ticks = 0;
    __block NSInteger cticks = 0;
    _viewabilityTimer = [NSTimer scheduledTimerWithTimeInterval:1
                                                         target:[NSBlockOperation blockOperationWithBlock:^{
        
        if (ticks >= MAX_TICKS) {
            [_viewabilityTimer invalidate];
            _viewabilityTimer = nil;
            
            if (cticks == MAX_TICKS) {
                [self sendAllEventsForKey:@"viewable_impr"];
            } else {
                NSLog(@"[AA :: Error] Did not send viewable impression");
            }
        } else {
            ticks++;
            
            CGRect childR = view.frame;
            CGRect superR = CGRectMake(0, 0, view.superview.frame.size.width, view.superview.frame.size.height);
            CGRect screenR = [UIScreen mainScreen].bounds;
            
            if ([SAUtils isRect:childR inRect:screenR] && [SAUtils isRect:childR inRect:superR]) {
                cticks++;
            }
            
            NSLog(@"[AA :: Info] Tick %ld/%d - Viewability Count %ld/%d", (long)ticks, MAX_TICKS, (long)cticks, MAX_TICKS);
        }
        
    }] selector:@selector(main) userInfo:nil repeats:YES];
    
    // fire the timer
    [_viewabilityTimer fire];
    
}

////////////////////////////////////////////////////////////////////////////////
// MARK: Handle Moat events
////////////////////////////////////////////////////////////////////////////////

- (NSString*) moatEventForWebPlayer:(id)webplayer {
    
    // form the moat dictionary
    NSDictionary *moatDict = @{
                               @"advertiser": @(_ad.advertiserId),
                               @"campaign": @(_ad.campaignId),
                               @"line_item": @(_ad.lineItemId),
                               @"creative": @(_ad.creative._id),
                               @"app": @(_ad.app),
                               @"placement": @(_ad.placementId),
                               @"publisher": @(_ad.publisherId)
                               };
    
    // basic moat tracking string
    NSString *moatString = @"";
    
    // get the class string
    // Class class = NSClassFromString(@"SAEvents");
    
    // get the selector
    SEL selector = NSSelectorFromString(@"sendDisplayMoatEvent:andAdDictionary:");
    
    // try to see if it responds
    if ([self respondsToSelector:selector]){
        
        // form the invocation
        NSMethodSignature *signature = [self methodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        [invocation setArgument:&webplayer atIndex:2];
        [invocation setArgument:&moatDict atIndex:3];
        [invocation retainArguments];
        [invocation invoke];
        void *tmpResult;
        [invocation getReturnValue:&tmpResult];
        
        // get the result
        moatString = (__bridge NSString*)tmpResult;
    }
    
    // return the moat-ified string
    return moatString;
}

- (void) moatEventForVideoPlayer:(AVPlayer*)player withLayer:(AVPlayerLayer*)layer andView:(UIView*)view {
    
    // also get the moat dict, another needed parameter
    NSDictionary *moatDict = @{
                               @"advertiser":@(_ad.advertiserId),
                               @"campaign":@(_ad.campaignId),
                               @"line_item":@(_ad.lineItemId),
                               @"creative":@(_ad.creative._id),
                               @"app":@(_ad.app),
                               @"placement":@(_ad.placementId),
                               @"publisher":@(_ad.publisherId)
                               };
    
    // get the class
    // Class class = NSClassFromString(@"SAEvents");
    
    // get the selector
    SEL selector = NSSelectorFromString(@"sendVideoMoatEvent:andLayer:andView:andAdDictionary:");
    
    // try to see if the class responds to the selector
    if ([self respondsToSelector:selector]) {
        
        // create the invocation
        NSMethodSignature *signature = [self methodSignatureForSelector:selector];
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
        [invocation setTarget:self];
        [invocation setSelector:selector];
        [invocation setArgument:&player atIndex:2];
        [invocation setArgument:&layer atIndex:3];
        [invocation setArgument:&view atIndex:4];
        [invocation setArgument:&moatDict atIndex:5];
        [invocation retainArguments];
        
        // finally invoke
        [invocation invoke];
    }
    
}

@end
