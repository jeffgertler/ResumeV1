//
//  settingsViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/16/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "settingsViewController.h"

@implementation settingsViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.primaryEmailTextField.delegate = self;
    self.secondaryEmailTextField.delegate = self;
    
    self.primaryEmailTextField.text = [GlobalData primaryEmail];
    self.secondaryEmailTextField.text = [GlobalData secondaryEmail];
    
    if ([GlobalData useSecondaryEmail]) {
        [[self secondaryEmailUseSwitch] setOn:YES];
    } else {
        [[self secondaryEmailUseSwitch] setOn:NO];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    [GlobalData saveState];
    return NO;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.primaryEmailTextField resignFirstResponder];
    [self.secondaryEmailTextField resignFirstResponder];
}

- (IBAction)resetPressed:(id)sender {
    [GlobalData resetDefaults];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [GlobalData setPrimaryEmail:[[self primaryEmailTextField] text]];
    [GlobalData setSecondaryEmail:[[self secondaryEmailTextField] text]];
    if ([[self secondaryEmailUseSwitch] isOn]) {
        [GlobalData setUseSecondaryEmail:YES];
    } else {
        [GlobalData setUseSecondaryEmail:NO];
    }
}


@end
