//
//  SAViewController.m
//  SAEvents
//
//  Created by Gabriel Coman on 03/09/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAMoatModule.h"
#import "SAEvents_Aux.h"

@interface SAViewController ()
@end

@implementation SAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, 320, 250)];
    [self.view addSubview:webView];
    
    SAAd *ad = [SAEvents_Aux getTestAd];
    
    SAMoatModule *module = [[SAMoatModule alloc] initWithAd:ad];
    
    NSString *moat = [module moatEventForWebPlayer:webView];
    
    NSLog(@"Moat is: %@", moat);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
