//
//  settingsViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/16/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "GlobalData.h"

@interface settingsViewController : UIViewController

- (IBAction)switchTouched:(id)sender;
- (IBAction)secondaryEmailTouched:(id)sender;

@property (weak, nonatomic) IBOutlet UILabel *offBtn;
@property (weak, nonatomic) IBOutlet UILabel *onBtn;
@property (weak, nonatomic) IBOutlet UITextField *primaryEmailTextField;
@property (weak, nonatomic) IBOutlet UITextField *secondaryEmailTextField;
@property (weak, nonatomic) IBOutlet UISwitch *secondaryEmailUseSwitch;
@end
