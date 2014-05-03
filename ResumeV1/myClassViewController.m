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
    
    [GlobalData addType:@"Contact"];
    [GlobalData addType:@"Education"];
    [GlobalData addType:@"Employment"];
    [GlobalData addType:@"Skills"];
    [GlobalData addType:@"Publications"];
    [GlobalData addType:@"Awards"];
    
    [Entry entryOfType:@"Contact" withHeader:@"John Smith" andPrimary:@"johnsmith@gmail.com\n(111) 111-1111" andSecondary:@"123 Broadway\n New York, NY, 12345"];
    [Entry entryOfType:@"Education" withHeader:@"New York University, New York, NY, expected May 2014" andPrimary:@"Bachelor of Science, Computer Science" andSecondary:@"Minor: Management"];
    [Entry entryOfType:@"Employment" withHeader:@"Allied-Signal Bendix Friction Material Division, Financial Planning Dept, Latham, NY" andPrimary:@"Buisiness Applications Programmer, Fall 2013" andSecondary:@"Developed forcasting systems which produce individual reports.\nDeveloped iall IFPS programs used for financial reports."];
    [Entry entryOfType:@"Employment" withHeader:@"Psychology Department, Rensselaer Polytechnic Institute" andPrimary:@"Research Programmer, Summer 2013" andSecondary:@"Performed Computer Aided Statistical analysis of data"];
    [Entry entryOfType:@"Skills" withHeader:@"Languages and Software" andPrimary:@"COBOL, IFPS, Focus, Megacalc, Pascal, Modula2, C, APL, SNOBOL, FORTRAN, LISP, SPIRES, BASIC, VSPC Autotab" andSecondary:@""];
    [Entry entryOfType:@"Skills" withHeader:@"Operating Systems" andPrimary:@"MTS, TSO, UNIX" andSecondary:@""];
    
    [Entry entryOfType:@"Awards" withHeader:@"Dean's List" andPrimary:@"2014, 2015" andSecondary:@""];
    [Entry entryOfType:@"Awards" withHeader:@"Salutatorian Medal" andPrimary:@"Mayfield Central School, NY" andSecondary:@"2010, 2011, 2012"];
    
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
