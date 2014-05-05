//
//  myClassViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "myClassViewController.h"
#import "Entry.h"
#import "GlobalData.h"

@interface myClassViewController ()

@end

@implementation myClassViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myTextField.delegate = self;
    
    // Color buttons etc.
    [self.addNewInfoBtn setBackgroundColor:Rgb2UIColor(255,255,255)];
    [self.addNewInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addNewInfoBtn.layer setBorderColor:[Rgb2UIColor(178,178,178) CGColor]];
    [self.addNewInfoBtn.layer setBorderWidth:1.0];
    [self.addNewInfoBtn.layer setCornerRadius:2.0];
    
    [self.reviewEntriesBtn setBackgroundColor:Rgb2UIColor(255,255,255)];
    [self.reviewEntriesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reviewEntriesBtn.layer setBorderColor:[Rgb2UIColor(178,178,178) CGColor]];
    [self.reviewEntriesBtn.layer setBorderWidth:1.0];
    [self.reviewEntriesBtn.layer setCornerRadius:2.0];
    
    [self.makeBtn setBackgroundColor:Rgb2UIColor(255,255,255)];
    [self.makeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.makeBtn.layer setBorderColor:[Rgb2UIColor(178,178,178) CGColor]];
    [self.makeBtn.layer setBorderWidth:1.0];
    [self.makeBtn.layer setCornerRadius:2.0];
    
    [self.settingsBtn setBackgroundColor:Rgb2UIColor(255,255,525)];
    [self.settingsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.settingsBtn.layer setBorderColor:[Rgb2UIColor(178,178,178) CGColor]];
    [self.settingsBtn.layer setBorderWidth:1.0];
    [self.settingsBtn.layer setCornerRadius:2.0];
    
    [self.view.layer setBackgroundColor:[Rgb2UIColor(255,255,255) CGColor]];
    //self.titleLabel.textAlignment
    //self.titleLabel.textAlignment = NSTextAlignmentCenter;
    //[self.titleLabel setBackgroundColor:Rgb2UIColor(48, 175, 226)];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)unwindToRoot:(UIStoryboardSegue *)segue{
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
