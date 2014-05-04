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
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
    self.startDateLabel.text = [self.entry getStartTimeString];
    self.endDateLabel.text = [self.entry getEndTimeString];
    [self setLabels];
}

- (void)viewDidAppear:(BOOL)animated {
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
    self.startDateLabel.text = [self.entry getStartTimeString];
    self.endDateLabel.text = [self.entry getEndTimeString];
    [self setLabels];
}

- (void)setLabels {
    if ([[GlobalData specialTypes] containsObject:self.entry.type]) {
        self.headerLabel.text = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:0];
        self.primaryLabel.text  = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:1];
        self.secondaryLabel.text = [[[GlobalData specialTypeOverrides] objectForKey:self.entry.type] objectAtIndex:2];
        if (self.secondaryLabel.text == @"NULL") {
            self.secondaryLabel.hidden = YES;
            self.SecondaryText.hidden = YES;
        }
    } else {
        self.headerLabel.text = @"Header";
        self.primaryLabel.text = @"Primary";
        self.secondaryLabel.text = @"Secondary";
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"EditSegue"]) {
        editEntryViewController *destViewController = segue.destinationViewController;
        destViewController.entry = self.entry;
    }
}

- (IBAction)removeEntry:(id)sender {
    [Entry removeEntry:self.entry];
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
