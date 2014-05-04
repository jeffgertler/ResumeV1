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
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = self.view.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor yellowColor] CGColor], (id)[[UIColor orangeColor] CGColor], nil];
    [self.view.layer insertSublayer:gradient atIndex:0];
    
    // Color buttons etc.
    [self.addNewInfoBtn.layer setBorderWidth:3.0];
    [self.addNewInfoBtn.layer setBackgroundColor:[[UIColor greenColor] CGColor]];
    [self.addNewInfoBtn.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.addNewInfoBtn.layer setShadowOffset:CGSizeMake(5, 5)];
    [self.addNewInfoBtn.layer setShadowColor:[[UIColor blackColor] CGColor]];
    [self.addNewInfoBtn.layer setShadowOpacity:0.5];
    [self.addNewInfoBtn.layer setCornerRadius:5.0];
    
    [self.reviewEntriesBtn.layer setBorderWidth:3.0];
    [self.reviewEntriesBtn.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    [self.makeBtn.layer setBorderWidth:3.0];
    [self.makeBtn.layer setBorderColor:[[UIColor whiteColor] CGColor]];
    
    [self.settingsBtn.layer setBorderWidth:3.0];
    [self.settingsBtn.layer setBorderColor:[[UIColor redColor] CGColor]];
    
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
