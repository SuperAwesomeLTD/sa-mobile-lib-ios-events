//
//  SAViewController.m
//  SAEvents
//
//  Created by Gabriel Coman on 03/09/2016.
//  Copyright (c) 2016 Gabriel Coman. All rights reserved.
//

#import "SAViewController.h"
#import "SAEvents.h"
#import "SAEVents+Moat.h"

@interface SAViewController ()

@end

@implementation SAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    if ([[SAEvents class] respondsToSelector:@selector(sendDisplayMoatEvent:andAdDictionary:)]){
        NSLog(@"%@ responds", @"abc");
    }
    
    [SAEvents sendCustomEvent:@"https://ads.superawesome.tv/v2" withPlacement:7186 withLineItem:30285 andCreative:30169 andEvent:@"custom.PopJame"];
    [SAEvents sendEventToURL:@"https://ads.superawesome.tv/v2/video/impression?placement=28000&creative=-1&line_item=-1&sdkVersion=unknown&rnd=8720845"];
    [SAEvents sendEventToURL:@"https://ads.superawesome.tv/v2/video/tracking?event=start&placement=28000&creative=-1&line_item=-1&sdkVersion=unknown&rnd=9833859"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
