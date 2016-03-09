//
//  SAEvents.m
//  Pods
//
//  Created by Gabriel Coman on 26/02/2016.
//
//

#import "SAEvents.h"
#import "SAUtils.h"
#import <SUPMoatMobileAppKit/SUPMoatMobileAppKit.h>

#define MOAT_DISPLAY_PARTNER_CODE @"superawesomeinappdisplay731223424656"
#define MOAT_VIDEO_PARTNER_CODE @"superawesomeinappvideo467548716573"

@implementation SAEvents

static bool isSATrackingEnabled = true;
static bool isMoatTrackingEnabled = true;

+ (void) sendEventToURL:(NSString *)url {
    if (!isSATrackingEnabled) return;
    [SAUtils sendGETtoEndpoint:url withQueryDict:NULL andSuccess:NULL orFailure:NULL];
}

+ (NSDictionary*) mapSADictoToMoatDict:(NSDictionary*)dict {
    return @{
             @"level1": @"SuperAwesome",
             @"level2": [dict objectForKey:@"campaignId"],
             @"level3": [dict objectForKey:@"lineItemId"],
             @"level4": [dict objectForKey:@"creativeId"],
             @"slicer1": [dict objectForKey:@"appId"],
             @"slider2": [dict objectForKey:@"placementId"]
             };
}

+ (void) sendDisplayMoatEvent:(UIView*)adView andAdDictionary:(NSDictionary*)adDict {
    if (!isMoatTrackingEnabled) return;
    
    SUPMoatTracker *tracker = [SUPMoatTracker trackerWithAdView:adView partnerCode:MOAT_DISPLAY_PARTNER_CODE];
    [tracker trackAd:[self mapSADictoToMoatDict:adDict]];
    
    NSLog(@"[AA :: Info] Sending Display Event to Moat");
}

+ (void) sendVideoMoatEvent:(AVPlayer*)player andLayer:(AVPlayerLayer*)layer andView:(UIView*)adView andAdDictionary:(NSDictionary*)adDict {
    if (!isMoatTrackingEnabled) return;
    
    SUPMoatVideoTracker *tracker = [SUPMoatVideoTracker trackerWithPartnerCode:MOAT_VIDEO_PARTNER_CODE];
    [tracker trackVideoAd:[self mapSADictoToMoatDict:adDict]
       usingAVMoviePlayer:player
                withLayer:layer
       withContainingView:adView];
    
    NSLog(@"[AA :: Info] Sending Video Event to Moat");
}

// functions to enable or disable tracking
+ (void) enableSATracking {
    isSATrackingEnabled = true;
}

+ (void) disableSATracking {
    isSATrackingEnabled = false;
}

+ (void) enableMoatTracking {
    isMoatTrackingEnabled = true;
}

+ (void) disableMoatTracking {
    isMoatTrackingEnabled = false;
}

@end
