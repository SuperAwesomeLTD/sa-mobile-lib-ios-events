#import "SAEvents+Moat.h"
#import <SUPMoatMobileAppKit/SUPMoatMobileAppKit.h>

#define MOAT_SERVER                 @"https://z.moatads.com"
#define MOAT_URL                    @"moatad.js"
#define MOAT_DISPLAY_PARTNER_CODE   @"superawesomeinappdisplay731223424656"
#define MOAT_VIDEO_PARTNER_CODE     @"superawesomeinappvideo467548716573"

@interface SAMoatModule () <SUPMoatTrackerDelegate, SUPMoatVideoTrackerDelegate>
@end

@implementation SAMoatModule (Moat)

+ (void) internalInitMoat {
    
    SUPMoatOptions *options = [[SUPMoatOptions alloc] init];
    options.locationServicesEnabled = false;
    options.IDFACollectionEnabled = false;
    options.debugLoggingEnabled = true;
    SUPMoatAnalytics *analytics = [SUPMoatAnalytics sharedInstance];
    [analytics startWithOptions:options];
    
}

- (NSString*) internalStartMoatTrackingForDisplay:(UIWebView*)webView
                                  andAdDictionary:(NSDictionary*)adDict {
    
    self.webTracker = [SUPMoatWebTracker trackerWithWebComponent:webView];
    self.webTracker.trackerDelegate = self;
    [self.webTracker startTracking];
    
    NSMutableString *moatQuery = [[NSMutableString alloc] init];
    [moatQuery appendFormat:@"moatClientLevel1=%@", [adDict objectForKey:@"advertiser"]];
    [moatQuery appendFormat:@"&moatClientLevel2=%@", [adDict objectForKey:@"campaign"]];
    [moatQuery appendFormat:@"&moatClientLevel3=%@", [adDict objectForKey:@"line_item"]];
    [moatQuery appendFormat:@"&moatClientLevel4=%@", [adDict objectForKey:@"creative"]];
    [moatQuery appendFormat:@"&moatClientSlicer1=%@", [adDict objectForKey:@"app"]];
    [moatQuery appendFormat:@"&moatClientSlicer2=%@", [adDict objectForKey:@"placement"]];
    [moatQuery appendFormat:@"&moatClientSlicer3=%@", [adDict objectForKey:@"publisher"]];
    
    return [NSString stringWithFormat:
            @"<script src=\"%@/%@/%@?%@\" type=\"text/javascript\"></script>",
            MOAT_SERVER,
            MOAT_DISPLAY_PARTNER_CODE,
            MOAT_URL,
            moatQuery];
}

- (BOOL) internalStopMoatTrackingForDisplay {
    if (self.webTracker) {
        [self.webTracker stopTracking];
        return true;
    }
    return false;
}

//

- (void)trackerStartedTracking:(SUPMoatBaseTracker *)tracker {
    NSLog(@"MOAT Tracker %@ started tracking", tracker);
}

- (void)trackerStoppedTracking:(SUPMoatBaseTracker *)tracker {
    NSLog(@"MOAT Tracker %@ stopped tracking", tracker);
}

- (void)tracker:(SUPMoatBaseTracker *)tracker
failedToStartTracking:(SUPMoatStartFailureType)type
         reason:(NSString *)reason {
    NSLog(@"MOAT Tracker %@ failed to start tracking", tracker);
}

- (BOOL) internalStartMoatTrackingForVideoPlayer:(AVPlayer*)player
                                       withLayer:(AVPlayerLayer*)layer
                                         andView:(UIView*)view
                                 andAdDictionary:(NSDictionary*)adDict {
    
    NSDictionary *moatDictionary = @{
                                     @"level1": [adDict objectForKey:@"advertiser"],
                                     @"level2": [adDict objectForKey:@"campaign"],
                                     @"level3": [adDict objectForKey:@"line_item"],
                                     @"level4": [adDict objectForKey:@"creative"],
                                     @"slicer1": [adDict objectForKey:@"app"],
                                     @"slicer2": [adDict objectForKey:@"placement"],
                                     @"slicer3": [adDict objectForKey:@"publisher"]
                                     };

    self.videoTracker = [SUPMoatAVVideoTracker trackerWithPartnerCode:MOAT_VIDEO_PARTNER_CODE];
    self.videoTracker.trackerDelegate = self;
    self.videoTracker.videoTrackerDelegate = self;
    
    return [self.videoTracker trackVideoAd:moatDictionary player:player layer:layer];
}

- (BOOL) internalStopMoatTrackingForVideoPlayer {
    if (self.videoTracker) {
        [self.videoTracker stopTracking];
        return true;
    }
    return false;
}

- (void)tracker:(SUPMoatBaseVideoTracker *)tracker
sentAdEventType:(SUPMoatAdEventType)adEventType {
    NSLog(@"MOAT Tracker %@ sending event %lu", tracker, (unsigned long)adEventType);
}

@end
