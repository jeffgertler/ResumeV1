//
//  editEntryViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/9/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "editEntryViewController.h"
#import "Entry.h"
#import "addDateViewController.h"

@interface editEntryViewController ()
@property (weak, nonatomic) IBOutlet UILabel *SectionLabel;
@property (weak, nonatomic) IBOutlet UITextView *TextField;
@property int currentSection;
@property NSArray *sections;
@property BOOL dateRecieved;

@end

@implementation editEntryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.sections = [[NSArray alloc] initWithObjects:@"Type", @"Header", @"Primary", @"Secondary", nil];
    self.currentSection = 0;
    self.SectionLabel.text = self.sections[self.currentSection];
    self.TextField.text = self.entry.type;
    self.dateRecieved = NO;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    if(self.dateRecieved){
        [self dismissViewControllerAnimated: YES completion: nil];
        [GlobalData saveState];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)nextPressed:(id)sender {
    if(self.currentSection == 0){
        self.entry.type = self.TextField.text;
        self.TextField.text = self.entry.header;
        self.currentSection++;
    } else if(self.currentSection == 1){
        self.entry.header = self.TextField.text;
        self.TextField.text = self.entry.primary;
        self.currentSection++;
    } else if(self.currentSection == 2){
        self.entry.primary = self.TextField.text;
        self.TextField.text = self.entry.secondary;
        self.currentSection++;
    } else if(self.currentSection == 3){
        self.entry.secondary = self.TextField.text;
        [self performSegueWithIdentifier:@"editDateSegue" sender:self];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"editDateSegue"]) {
        addDateViewController *destViewController = (addDateViewController *)segue.destinationViewController;
        destViewController.entry = self.entry;
        destViewController.cameFromEditEntry = YES;
        self.dateRecieved = YES;
    }
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
