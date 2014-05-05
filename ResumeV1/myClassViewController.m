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
    
    self.view.backgroundColor = Rgb2UIColor(230, 230, 230);
    
    // Color buttons etc.
    [self.addNewInfoBtn setBackgroundColor:Rgb2UIColor(255, 255, 255)];
    [self.addNewInfoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.addNewInfoBtn.layer setCornerRadius:5.0];
    
    [self.reviewEntriesBtn setBackgroundColor:Rgb2UIColor(255, 255, 255)];
    [self.reviewEntriesBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.reviewEntriesBtn.layer setCornerRadius:5.0];
    
    [self.makeBtn setBackgroundColor:Rgb2UIColor(255, 255, 255)];
    [self.makeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.makeBtn.layer setCornerRadius:5.0];
    
    [self.settingsBtn setBackgroundColor:Rgb2UIColor(255, 255, 255)];
    [self.settingsBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.settingsBtn.layer setCornerRadius:5.0];
    
}
- (IBAction)saveData:(id)sender {
    [GlobalData saveState];
}
- (IBAction)loadData:(id)sender {
    [GlobalData loadState];
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
