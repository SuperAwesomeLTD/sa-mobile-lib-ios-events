//
//  SAEvents_Aux.m
//  SAEvents
//
//  Created by Gabriel Coman on 01/03/2017.
//  Copyright © 2017 Gabriel Coman. All rights reserved.
//

#import "SAEvents_Aux.h"
#import "SAAd.h"
#import "SACreative.h"
#import "SADetails.h"
#import "SAMedia.h"
#import "SAVASTAd.h"
#import "SAVASTEvent.h"

@implementation SAEvents_Aux

+ (SAAd *) getTestAd {
    
    SAAd *ad = [[SAAd alloc] init];
    
    ad.error = 0;
    ad.advertiserId = 1;
    ad.publisherId = 1;
    ad.appId = 1568;
    ad.lineItemId = 1137;
    ad.campaignId = 1269;
    ad.placementId = 628;
    ad.campaignType = SA_CPM;
    ad.moat = 0.2;
    ad.isPadlockVisible = true;
    ad.creative._id = 5879;
    ad.creative.format = SA_Video;
    
    SAVASTEvent *e1 = [[SAVASTEvent alloc] init];
    e1.event = @"vast_creativeView";
    e1.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=creativeView&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=431411&device=web&country=GB";
    SAVASTEvent *e2 = [[SAVASTEvent alloc] init];
    e2.event = @"vast_start";
    e2.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=start&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=88060&device=web&country=GB";
    SAVASTEvent *e3 = [[SAVASTEvent alloc] init];
    e3.event = @"vast_firstQuartile";
    e3.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=firstQuartile&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=8852120&device=web&country=GB";
    SAVASTEvent *e4 = [[SAVASTEvent alloc] init];
    e4.event = @"vast_midpoint";
    e4.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=midpoint&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=9188166&device=web&country=GB";
    SAVASTEvent *e5 = [[SAVASTEvent alloc] init];
    e5.event = @"vast_thirdQuartile";
    e5.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=thirdQuartile&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=3030429&device=web&country=GB";
    SAVASTEvent *e6 = [[SAVASTEvent alloc] init];
    e6.event = @"vast_complete";
    e6.URL = @"https://ads.staging.superawesome.tv/v2/video/tracking?event=complete&placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=3260747&device=web&country=GB";
    SAVASTEvent *e7 = [[SAVASTEvent alloc] init];
    e7.event = @"vast_error";
    e7.URL = @"https://ads.staging.superawesome.tv/v2/video/error?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=1176843&device=web&country=GB&code=[ERRORCODE]";
    SAVASTEvent *e8 = [[SAVASTEvent alloc] init];
    e8.event = @"vast_impression";
    e8.URL = @"https://ads.staging.superawesome.tv/v2/video/impression?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=1956493&device=web&country=GB";
    SAVASTEvent *e9 = [[SAVASTEvent alloc] init];
    e9.event = @"vast_click_tracking";
    e9.URL = @"https://ads.staging.superawesome/v2/2432/click_tracking";
    SAVASTEvent *e10 = [[SAVASTEvent alloc] init];
    e10.event = @"vast_click_through";
    e10.URL = @"https://ads.staging.superawesome.tv/v2/video/click?placement=628&creative=5879&line_item=1137&sdkVersion=unknown&rnd=8439823&device=web&country=GB";
    [ad.creative.details.media.vastAd.events addObject:e1];
    [ad.creative.details.media.vastAd.events addObject:e2];
    [ad.creative.details.media.vastAd.events addObject:e3];
    [ad.creative.details.media.vastAd.events addObject:e4];
    [ad.creative.details.media.vastAd.events addObject:e5];
    [ad.creative.details.media.vastAd.events addObject:e6];
    [ad.creative.details.media.vastAd.events addObject:e7];
    [ad.creative.details.media.vastAd.events addObject:e8];
    [ad.creative.details.media.vastAd.events addObject:e9];
    [ad.creative.details.media.vastAd.events addObject:e10];
    
    
    return ad;
    
}

@end
