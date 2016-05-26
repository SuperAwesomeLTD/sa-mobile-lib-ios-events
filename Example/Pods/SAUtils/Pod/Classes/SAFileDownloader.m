//
//  SAFileDownloader.m
//  Pods
//
//  Created by Gabriel Coman on 18/04/2016.
//
//

#import "SAFileDownloader.h"

// defines
#define SA_FILE_STORE @"SA_FILE_STORE"

//
// private vars for SAFileDownloader
@interface SAFileDownloader ()
// dictionary that holds all the files currently saved on disk as part of the SDK
@property (nonatomic, strong) NSMutableDictionary *fileStore;
@property (nonatomic, strong) NSFileManager *fileManager;
@property (nonatomic, strong) NSUserDefaults *defs;
@end

//
// actual implementation of SAFileDownloader
@implementation SAFileDownloader

+ (SAFileDownloader *) getInstance {
    static SAFileDownloader *sharedManager = nil;
    @synchronized(self) {
        if (sharedManager == nil){
            sharedManager = [[self alloc] init];
        }
    }
    return sharedManager;
}

- (instancetype) init {
    if (self = [super init]) {
        // get user defaults and file manager
        _defs = [NSUserDefaults standardUserDefaults];
        _fileManager = [NSFileManager defaultManager];
        
        // get the file store
        if ([_defs objectForKey:SA_FILE_STORE]) {
            _fileStore = [[_defs objectForKey:SA_FILE_STORE] mutableCopy];
        } else {
            _fileStore = [[NSMutableDictionary alloc] init];
        }
        
        // do a preliminary cleanup
        [self cleanup];
    }
    return self;
}

- (NSString*) downloadFileSync:(NSString *)url {
    // file data
    NSData *data = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:url]];
    
    // file data
    if (data != NULL) {
        NSString *key = [SAUtils generateUniqueKey];
        NSString *filePath = [NSString stringWithFormat:@"samov_%@.mp4", key];
        NSString *fullFilePath = [SAUtils filePathInDocuments:filePath];
        NSError *fileError = NULL;
        if (filePath != NULL) {
            [data writeToFile:fullFilePath options:NSDataWritingAtomic error:&fileError];
        }
        // file written ok
        if (fileError == NULL) {
            // save
            [_fileStore setObject:filePath forKey:key];
            [_defs setObject:_fileStore forKey:SA_FILE_STORE];
            [_defs synchronize];
            
            // call success
            return filePath;
        }
        // failure to write file
        else {
            return NULL;
        }
    }
    // the response will be Null
    else {
        return NULL;
    }
}

- (void) downloadFileAsync:(NSString *)url withSuccess:(downloadSuccess)success orFailure:(failure)failure {
    
    // form the URL & request
    NSURL *URL = [NSURL URLWithString:url];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:URL];
    [request setHTTPMethod:@"GET"];
    
    // the response
    netresponse resp = ^(NSURLResponse * response, NSData * data, NSError * error) {
        NSInteger statusCode = ((NSHTTPURLResponse*)response).statusCode;
        
        // check for whatever error
        if (error != NULL || statusCode != 200) {
            failure();
        }
        // goto success
        else {
            NSString *key = [SAUtils generateUniqueKey];
            NSString *filePath = [NSString stringWithFormat:@"samov_%@.mp4", key];
            NSString *fullFilePath = [SAUtils filePathInDocuments:filePath];
            NSError *fileError = NULL;
            if (filePath != NULL) {
                [data writeToFile:fullFilePath options:NSDataWritingAtomic error:&fileError];
            }
            // file written ok
            if (fileError == NULL) {
                // save
                [_fileStore setObject:filePath forKey:key];
                [_defs setObject:_fileStore forKey:SA_FILE_STORE];
                [_defs synchronize];
                
                // call success
                success(filePath);
            }
            // failure to write file
            else {
                failure();
            }
        }
    };
    
    // make the request and get back the data
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue currentQueue]
                           completionHandler:resp];
}

#pragma mark Aux Functions

- (void) cleanup {
    
    for (NSString *key in _fileStore.allKeys) {
        NSString *filePath = [_fileStore objectForKey:key];
        NSString *fullFilePath = [SAUtils filePathInDocuments:filePath];
        if ([_fileManager fileExistsAtPath:fullFilePath] && [_fileManager isDeletableFileAtPath:fullFilePath]) {
            [_fileManager removeItemAtPath:fullFilePath error:nil];
            NSLog(@"Deleted %@ from docs dir", filePath);
        } else {
            NSLog(@"Could not delete %@ from docs dir", filePath);
        }
    }
    
    // remove
    [_fileStore removeAllObjects];
    [_defs removeObjectForKey:SA_FILE_STORE];
    [_defs synchronize];
}

@end
