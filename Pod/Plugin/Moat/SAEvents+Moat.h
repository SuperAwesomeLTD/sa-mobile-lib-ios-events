//
//  SAEvents+Moat.h
//  Pods
//
//  Created by Gabriel Coman on 01/06/2016.
//
//

#import <Foundation/Foundation.h>
#import "SAEvents.h"

//
// forward declarations
@class AVPlayer;
@class AVPlayerLayer;

@interface SAEvents (Moat)

// functions to enable or disable tracking
+ (void) enableMoatTracking;
+ (void) disableMoatTracking;

//
// This function sends display data to Moat
+ (void) sendDisplayMoatEvent:(UIView*)adView andAdDictionary:(NSDictionary*)adDict;


// This function sends video events to Moat
+ (void) sendVideoMoatEvent:(AVPlayer*)player andLayer:(AVPlayerLayer*)layer andView:(UIView*)adView andAdDictionary:(NSDictionary*)adDict;

@end
