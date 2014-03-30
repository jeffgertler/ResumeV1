//
//  reviewEntriesViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "reviewEntriesViewController.h"
#import "entryDetailViewController.h"
#import "Entry.h"

@interface reviewEntriesViewController ()

@end

@implementation reviewEntriesViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.validTypes = [[NSArray alloc] initWithObjects:@"Contact", @"Education", @"Employment", @"Skills", @"Publications", nil];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [self.validTypes count];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [Entry numEntriesWithType: self.validTypes[section]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    [[[Entry entriesWithType:self.validTypes[indexPath.section]] objectAtIndex:indexPath.row] printEntry];
    cell.textLabel.text = [[[Entry entriesWithType:self.validTypes[indexPath.section]] objectAtIndex:indexPath.row] getTitle];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        entryDetailViewController *destViewController = segue.destinationViewController;
        Entry *entry = [[Entry entriesWithType:self.validTypes[indexPath.section]] objectAtIndex:indexPath.row];
        destViewController.header= entry.header;
        destViewController.primary = entry.primary;
        destViewController.secondary = entry.secondary;
        NSLog(destViewController.header);
        NSLog(entry.header);
    }
}

- (IBAction)unwindToRoot:(UIStoryboardSegue *)segue{
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
