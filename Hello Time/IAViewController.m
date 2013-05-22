//
//  IAViewController.m
//  Hello Time
//
//  Created by Marius Butuc on 13-05-17.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import "IAViewController.h"

@interface IAViewController ()

@end

@implementation IAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self checkTime:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)checkTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm:ss a"];
    [self.timeLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(checkTime:) withObject:self afterDelay:1.0];
}

@end
