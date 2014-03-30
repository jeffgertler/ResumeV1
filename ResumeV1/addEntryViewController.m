//
//  addEntryViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "addEntryViewController.h"

@interface addEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *TextField;
@property (weak, nonatomic) IBOutlet UILabel *SectionLabel;
@property int currentSection;
@property NSArray *Sections;


@end

@implementation addEntryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)nextPressed:(id)sender {
    _currentSection++;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
