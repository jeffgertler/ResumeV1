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
@property NSMutableArray *sections;
@property BOOL dateRecieved;
@property (weak, nonatomic) IBOutlet UIButton *temporaryButton;
@property (weak, nonatomic) IBOutlet UIButton *permanentButton;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@property (weak, nonatomic) IBOutlet UILabel *headingLabel;

@end

@implementation editEntryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
	self.sections = [[NSMutableArray alloc] initWithObjects:@"Type", @"Header", @"Primary", @"Secondary", nil];
    self.currentSection = 1;
    self.SectionLabel.text = self.sections[self.currentSection];
    self.TextField.text = self.entry.type;
    self.dateRecieved = NO;
    self.temporaryButton.hidden = YES;
    self.permanentButton.hidden = YES;
    
    // Handle special information for default types
    if ([[GlobalData specialTypes] containsObject:self.entry.type]) {
        [[self sections] replaceObjectAtIndex:1 withObject:[[[GlobalData specialTypeOverrides] objectForKey:self.TextField.text] objectAtIndex:0]];
        [[self sections] replaceObjectAtIndex:2 withObject:[[[GlobalData specialTypeOverrides] objectForKey:self.TextField.text] objectAtIndex:1]];
        [[self sections] replaceObjectAtIndex:3 withObject:[[[GlobalData specialTypeOverrides] objectForKey:self.TextField.text] objectAtIndex:2]];
    }
    
    self.headingLabel.text = self.sections[self.currentSection];}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    if (self.dateRecieved) {
        [self dismissViewControllerAnimated: YES completion: nil];
        [GlobalData saveState];
    }
    self.TextField.text = self.entry.header;
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)nextPressed:(id)sender {
    
    // Set as edited & advance
    if(self.currentSection == 1){
        self.entry.header = self.TextField.text;
        self.TextField.text = self.entry.primary;
        self.currentSection++;
    } else if(self.currentSection == 2){
        self.entry.primary = self.TextField.text;
        self.TextField.text = self.entry.secondary;
        self.currentSection++;
    } else if(self.currentSection == 3){
        self.entry.secondary = self.TextField.text;
        if([self.entry.type isEqualToString:@"Contact"]){
            self.TextField.hidden = YES;
            self.SectionLabel.hidden = YES;
            self.nextButton.hidden = YES;
            self.permanentButton.hidden = NO;
            self.temporaryButton.hidden = NO;
        } else {
            [self performSegueWithIdentifier:@"editDateSegue" sender:self];
        }
    }
    self.headingLabel.text = self.sections[self.currentSection];
}

- (IBAction)temporaryPressed:(id)sender {
    [self.entry setTime:@[@"", @"Permanent", @"", @"", @"", @""]];
    [self dismissViewControllerAnimated: YES completion: nil];
}
- (IBAction)permanentPressed:(id)sender {
    [self.entry setTime:@[@"", @"Temporary", @"", @"", @"", @""]];
    [self dismissViewControllerAnimated: YES completion: nil];
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
