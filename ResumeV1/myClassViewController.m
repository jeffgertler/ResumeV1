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
    [Entry entryOfType:@"Contact" withHeader:@"John Smith" andPrimary:@"johnsmith@gmail.com\n(111)111-1111" andSecondary:@"123 Broadway\n New York, NY, 12345"];
    [Entry entryOfType:@"Education" withHeader:@"Bachelor of Science, Computer Science" andPrimary:@"New York University, New York, NY, expected May 2014" andSecondary:@"Minor: Management"];
    [Entry entryOfType:@"Employment" withHeader:@"Buisiness Applications Programmer, Fall 2013" andPrimary:@"Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY" andSecondary:@"*Developed forcasting systems which produce individual reports.\n* Developed iall IFPS programs used for financial reports."];
    [Entry entryOfType:@"Employment" withHeader:@"Research Programmer, Summer 2013" andPrimary:@"Psychology Department, Rensselaer Polytechnic Institute" andSecondary:@"Performed Computer Aided Statistical analysis of data"];
    [Entry entryOfType:@"Skills" withHeader:@"Languages and Software:" andPrimary:@"COBOL, IFPS, Focus, Megacalc, Pascal, Modula2, C, APL, SNOBOL, FORTRAN, LISP, SPIRES, BASIC, VSPC Autotab" andSecondary:@"Operating Systems: MTS, TSO, UNIX"];
    //[Entry entryOfType:@"Publications" withHeader:@"" andPrimary:@"jmg789@nyu.edu" andSecondary:@"(206)819-8815"];
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
