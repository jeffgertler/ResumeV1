//
//  checkSecondariesViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/9/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "checkSecondariesViewController.h"
#import "Entry.h"
#import "GlobalData.h"

@interface checkSecondariesViewController ()

@property NSMutableArray *entriesNeedingSecondaries;

@end

@implementation checkSecondariesViewController

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [GlobalData typesSize];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [GlobalData numReadyEntriesWithType: [GlobalData getTypeAt:section]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    cell.textLabel.text = [[[GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row] getTitle];
    cell.accessoryType = UITableViewCellAccessoryNone;
    for(Entry *entry in self.entriesNeedingSecondaries){
        if([cell.textLabel.text isEqualToString:[entry getTitle]]){
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
    
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
        [self.entriesNeedingSecondaries removeObject:[[GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row]];
        [GlobalData setEntriesNeedingSecondaries:self.entriesNeedingSecondaries];
        tableCell.accessoryType = UITableViewCellAccessoryNone;
    }
    else {
        [self.entriesNeedingSecondaries addObject:[[GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row]];
        [GlobalData setEntriesNeedingSecondaries:self.entriesNeedingSecondaries];
        tableCell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
}

- (IBAction)unwindToCheckSecondaries:(UIStoryboardSegue *)segue{
}


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
    self.entriesNeedingSecondaries = [[NSMutableArray alloc] init];
    for(NSString *type in _typesNeedingSecondaries){
        for(Entry *entry in [GlobalData readyEntriesWithType:type]){
            if([entry.type isEqualToString:type]){
                [self.entriesNeedingSecondaries addObject:entry];
            }
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
