//
//  SAViewController.m
//  SAEvents
//
//  Created by Gabriel Coman on 03/09/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAEvents.h"
#if defined(__has_include)
#if __has_include("SAEvents+Moat.h")
#import "SAEvents+Moat.h"
#endif
#endif

@interface SAViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *testWebView;
@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    
    [SAEvents sendCustomEvent:@"https://ads.superawesome.tv/v2" withPlacement:7186 withLineItem:30285 andCreative:30169 andEvent:@"custom.PopJam"];
    [SAEvents sendEventToURL:@"https://ads.superawesome.tv/v2/video/impression?placement=28000&creative=-1&line_item=-1&sdkVersion=unknown&rnd=8720845"];
    [SAEvents sendEventToURL:@"https://ads.superawesome.tv/v2/video/tracking?event=start&placement=28000&creative=-1&line_item=-1&sdkVersion=unknown&rnd=9833859"];
    
    NSString *fullString = @"<html><head><title>Test</title></head><body><div>Test HTML</div>_MOAT_</body></html>";
    NSString *moatString = @"";
    
    Class class = NSClassFromString(@"SAEvents");
    SEL selector = NSSelectorFromString(@"sendDisplayMoatEvent:andAdDictionary:");
    if ([class respondsToSelector:selector]){
        NSLog(@"Responds");
        
        NSDictionary *dict = @{
                               @"advertiser":@(1),
                               @"campaign":@(117),
                               @"line_item":@(138),
                               @"creative":@(114),
                               @"app":@(105),
                               @"placement":@(113),
                               @"publisher":@(1)
                               };
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [class performSelector:selector withObject:_testWebView withObject:dict];
#pragma clang diagnostic pop
    } else {
        NSLog(@"Does not respond");
    }
    
    fullString = [fullString stringByReplacingOccurrencesOfString:@"_MOAT_" withString:moatString];
    [_testWebView loadHTMLString:fullString baseURL:NULL];
    
    NSLog(@"%@", fullString);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
