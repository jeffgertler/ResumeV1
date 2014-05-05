//
//  entryDetailViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/29/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "entryDetailViewController.h"

@implementation entryDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Graphics
    [self.HeaderText.layer setBorderColor:[Rgb2UIColor(210,210,210) CGColor]];
    [self.HeaderText.layer setBorderWidth:1.0];
    [self.HeaderText.layer setCornerRadius:3.0];
    [self.PrimaryText.layer setBorderColor:[Rgb2UIColor(210,210,210) CGColor]];
    [self.PrimaryText.layer setBorderWidth:1.0];
    [self.PrimaryText.layer setCornerRadius:3.0];
    [self.SecondaryText.layer setBorderColor:[Rgb2UIColor(210,210,210) CGColor]];
    [self.SecondaryText.layer setBorderWidth:1.0];
    [self.SecondaryText.layer setCornerRadius:3.0];
    
    // Logic
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
    self.startDateLabel.text = [self.entry getStartTimeString];
    self.endDateLabel.text = [self.entry getEndTimeString];
    if([[self.entry getStartTimeString] isEqualToString:@"  "]){
        self.startDateLabel.text = @"None";
    }
    if([[self.entry getEndTimeString] isEqualToString:@"  "]){
        self.endDateLabel.text = @"None";
    }
    [self setLabels];
}

- (void)viewDidAppear:(BOOL)animated {
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
    self.startDateLabel.text = [self.entry getStartTimeString];
    self.endDateLabel.text = [self.entry getEndTimeString];
    if([[self.entry getStartTimeString] isEqualToString:@"  "]){
        self.startDateLabel.text = @"None";
    }
    if([[self.entry getEndTimeString] isEqualToString:@"  "]){
        self.endDateLabel.text = @"None";
    }
    [self setLabels];
}

- (void)setLabels {
    if ([[GlobalData specialTypes] containsObject:self.entry.type]) {
        self.headerLabel.text = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:0];
        self.primaryLabel.text  = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:1];
        self.secondaryLabel.text = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:2];
        if ([self.secondaryLabel.text  isEqual: @"NULL"]) {
            self.secondaryLabel.hidden = YES;
            self.SecondaryText.hidden = YES;
        }
    } else {
        self.headerLabel.text = @"Header";
        self.primaryLabel.text = @"Primary";
        self.secondaryLabel.text = @"Secondary";
    }
    if([self.entry.type isEqualToString:@"Contact"]){
        self.startSectionLabel.text = @"Address:";
        self.endSectionLabel.hidden = YES;
        self.endDateLabel.hidden = YES;
        self.startDateLabel.text = [self.entry getTimes][1];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        editEntryViewController *destViewController = segue.destinationViewController;
        destViewController.entry = self.entry;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.HeaderText resignFirstResponder];
    [self.PrimaryText resignFirstResponder];
    [self.SecondaryText resignFirstResponder];
}

- (IBAction)removeEntry:(id)sender {
    [Entry removeEntry:self.entry];
    [GlobalData saveState];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)unwindToEntryDetail:(UIStoryboardSegue *)segue {
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
