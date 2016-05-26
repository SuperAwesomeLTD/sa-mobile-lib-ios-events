//
//  SAFileDownloader.h
//  Pods
//
//  Created by Gabriel Coman on 18/04/2016.
//
//

#import <Foundation/Foundation.h>

//
// import SAUtils
#import "SAUtils.h"

//
// callback for generic success with data
typedef void (^downloadSuccess)(NSString *fpath);

//
// class that deals with downloading (and cleaning-up) files
@interface SAFileDownloader : NSObject

//
// singleton instance (instead of init)
+ (SAFileDownloader*) getInstance;

/**
 *  Download a file from the network
 *
 *  @param url the remote URL of the file
 *
 *  @return returns the filepath of the new file, on disk
 */
- (NSString*) downloadFileSync:(NSString*)url;

/**
 *  Function that downloads a file and saves it to the documents directory
 *
 *  @param url     the remote URL of the file
 *  @param success a success callback with the file's path
 *  @param failure a failure callback in case file could not be donwloaded
 */
- (void) downloadFileAsync:(NSString*)url withSuccess:(downloadSuccess)success orFailure:(failure)failure;

@end
