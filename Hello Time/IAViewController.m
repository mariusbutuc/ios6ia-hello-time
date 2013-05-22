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
    NSLog(@"viewDidLoad called");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    NSLog(@"viewDidAppear called");
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSLog(@"viewWillAppear called");
}

- (void)checkTime:(id)sender
{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"h:mm:ss a"];
    [self.timeLabel setText:[formatter stringFromDate:[NSDate date]]];
    
    [self performSelector:@selector(checkTime:) withObject:self afterDelay:1.0];
}

- (IBAction)toggleMode:(id)sender
{
    if ([self.modeButton.titleLabel.text isEqualToString:@"Night"])
    {
        self.view.backgroundColor = [UIColor blackColor];
        self.timeLabel.textColor = [UIColor whiteColor];
        [self.modeButton setTitle:@"Day" forState:UIControlStateNormal];
    } else {
        self.view.backgroundColor = [UIColor whiteColor];
        self.timeLabel.textColor = [UIColor blackColor];
        [self.modeButton setTitle:@"Night" forState:UIControlStateNormal];
    }
}

- (void) willAnimateRotationToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration
{
    CGRect timeFrame = self.timeLabel.frame;
    float viewHeight = self.view.frame.size.height;
    float viewWidth  = self.view.frame.size.width;
    float fontSize   = 30.0f;
    BOOL hideButton  = YES;
    
    if (UIInterfaceOrientationIsLandscape(self.interfaceOrientation)) {
        fontSize = 40.0f;
        timeFrame.origin.y = (viewWidth / 2) - timeFrame.size.height;
    } else {
        hideButton = NO;
        timeFrame.origin.y = (viewHeight / 2) - timeFrame.size.height;
    }
    
    [self.modeButton setHidden:hideButton];
    [self.timeLabel setFont:[UIFont boldSystemFontOfSize:fontSize]];
    [self.timeLabel setFrame:timeFrame];
}

- (NSUInteger) supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait | UIInterfaceOrientationMaskLandscape;
}

@end
