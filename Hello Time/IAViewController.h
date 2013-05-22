//
//  IAViewController.h
//  Hello Time
//
//  Created by Marius Butuc on 13-05-17.
//  Copyright (c) 2013 Marius Butuc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IAViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UIButton *modeButton;
- (IBAction)toggleMode:(id)sender;
@end
