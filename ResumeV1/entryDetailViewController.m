//
//  entryDetailViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/29/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "entryDetailViewController.h"
#import "reviewEntriesViewController.h"
#import "editEntryViewController.h"
#import "Entry.h"

@interface entryDetailViewController ()

@end

@implementation entryDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
}

-(void)viewDidAppear:(BOOL)animated {
    self.HeaderText.text = self.entry.header;
    self.PrimaryText.text = self.entry.primary;
    self.SecondaryText.text = self.entry.secondary;
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
