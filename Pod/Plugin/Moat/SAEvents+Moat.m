#import "SAEvents+Moat.h"

//#if defined(__has_include)
//#if __has_include("SUPMoatAnalytics.h")
//
//    #define HAS_MOAT true
//#else
//    #define HAS_MOAT false
//#endif
//#endif

#import "SUPMoatAnalytics.h"

#if defined(__has_include)
#if __has_include(<SAUtils/SAUtils.h>)
#import <SAUtils/SAUtils.h>
#else
#import "SAUtils.h"
#endif
#endif

#define MOAT_SERVER                 @"https://z.moatads.com"
#define MOAT_URL                    @"moatad.js"
#define MOAT_DISPLAY_PARTNER_CODE   @"superawesomeinappdisplay731223424656"
#define MOAT_VIDEO_PARTNER_CODE     @"superawesomeinappvideo467548716573"

@implementation SAMoatModule (Moat)

- (void) initMoat {
    
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

    self.videoTracker = [SUPMoatVideoTracker trackerWithPartnerCode:MOAT_VIDEO_PARTNER_CODE];
    
    return [self.videoTracker trackVideoAd:moatDictionary
                        usingAVMoviePlayer:player
                                 withLayer:layer
                        withContainingView:view];
    
}

- (BOOL) internalStopMoatTrackingForVideoPlayer {
    if (self.videoTracker) {
        [self.videoTracker stopTracking];
        return true;
    }
    return false;
}

@end
