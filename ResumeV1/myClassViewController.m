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
