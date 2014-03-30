//
//  myClassViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "myClassViewController.h"
#import "Entry.h"

@interface myClassViewController ()

@end

@implementation myClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTextField.delegate = self;
    [Entry entryOfType:@"Contact" withHeader:@"Jeff" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
    [Entry entryOfType:@"Contact" withHeader:@"Jeff" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
    [Entry entryOfType:@"Education" withHeader:@"Kelly" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
    [Entry entryOfType:@"Employment" withHeader:@"Jeff" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
    [Entry entryOfType:@"Skills" withHeader:@"Jeff" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
    [Entry entryOfType:@"Publications" withHeader:@"Jeff" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
