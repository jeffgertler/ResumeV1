//
//  makeViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/2/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "makeViewController.h"
#import "Entry.h"
#import "GlobalData.h"

@interface makeViewController ()

@property NSMutableArray *addedEntries;

@end

@implementation makeViewController
@synthesize tableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addedEntries= [[NSMutableArray alloc] init];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [GlobalData typesSize];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [Entry numEntriesWithType: [GlobalData getTypeAt:section]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    cell.textLabel.text = [[[Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row] getTitle];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return [GlobalData getTypeAt:section];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *tableCell = [self.tableView cellForRowAtIndexPath:indexPath];
    BOOL isSelected = (tableCell.accessoryType == UITableViewCellAccessoryCheckmark);
    if (isSelected) {
        [self.addedEntries removeObject:[[Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row]];
        tableCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        [self.addedEntries addObject:[[Entry entriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row]];
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (IBAction)makePressed:(id)sender {
    for(Entry *entry in self.addedEntries){
        NSLog(@"%@", entry.header);
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
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
