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
#import "GlobalData.h"
#import "NetworkComm.h"

@interface reviewEntriesViewController ()

@end

@implementation reviewEntriesViewController
@synthesize tableView;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.tableView reloadData];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.tableView reloadData];
    [super viewDidAppear:YES];
    
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [GlobalData typesSize];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([Entry numEntriesWithType: [GlobalData getTypeAt:section]] == 0){
        return 1;
    }
    return [Entry numEntriesWithType: [GlobalData getTypeAt:section]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    if([Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]].count == 0){
        cell.textLabel.text = @"No entries of this type";
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor grayColor];
    } else {
        cell.textLabel.text = [[[Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row] getTitle];
    }
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [GlobalData getTypeAt:section];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"DetailSegue"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        entryDetailViewController *destViewController = segue.destinationViewController;
        if(![Entry numEntriesWithType:[GlobalData getTypeAt:indexPath.section]] == 0){
            Entry *entry = [[Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row];
            destViewController.entry = entry;
        }
    }
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    NSIndexPath *path = [self.tableView indexPathForSelectedRow];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:path];
    if([identifier isEqualToString: @"DetailSegue"]){
        return !([cell.textLabel.text isEqualToString:@"No entries of this type"]);
    }
    return YES;
}

- (IBAction)unwindToReview:(UIStoryboardSegue *)segue{
    //[networkComm sendMessage:@"test message"];
    
    //NSLog(@"%@", [NetworkComm sendMessage:@"TST MSG SYS"]);
    
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
