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
    if ([[GlobalData secondaryEmail] length] == 0) {
        [self.secondaryEmailUseSwitch setOn:NO];
    } else {
        [self.secondaryEmailUseSwitch setOn:YES];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}


- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.primaryEmailTextField resignFirstResponder];
    [self.secondaryEmailTextField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [GlobalData setPrimaryEmail:[[self primaryEmailTextField] text]];
    if ([[self secondaryEmailUseSwitch] isOn]) {
        [GlobalData setSecondaryEmail:[[self secondaryEmailTextField] text]];
    }
}


@end
