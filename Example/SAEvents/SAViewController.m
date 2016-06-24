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
    
    NSLog(@"Here");
    
    if ([[SAEvents class] respondsToSelector:@selector(sendDisplayMoatEvent:andAdDictionary:)]){
        NSLog(@"%@ responds", @"abc");
    }
    
    [SAEvents sendCustomEvent:@"https://ads.superawesome.tv/v2" withPlacement:7186 withLineItem:30285 andCreative:30169 andEvent:@"custom.PopJame"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
