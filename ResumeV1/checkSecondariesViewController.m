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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.entriesNeedingSecondaries = [[NSMutableArray alloc] init];
    for(Entry *entry in [GlobalData getReadyEntries]){
        [self.entriesNeedingSecondaries addObject:entry];
    }
    [GlobalData setEntriesNeedingSecondaries:self.entriesNeedingSecondaries];
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return [GlobalData typesSize];
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if([GlobalData numReadyEntriesWithType: [GlobalData getTypeAt:section]] == 0){
        return 1;
    }
    return [GlobalData numReadyEntriesWithType: [GlobalData getTypeAt:section]];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"tableCell"];
    }
    if([GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]].count == 0){
        cell.textLabel.text = @"No entries of this type";
        cell.accessoryType = UITableViewCellAccessoryNone;
        cell.textLabel.textColor = [UIColor grayColor];
    } else {
        cell.textLabel.text = [[[GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row] getTitle];
        cell.accessoryType = UITableViewCellAccessoryNone;
        for(Entry *entry in self.entriesNeedingSecondaries){
            if([[GlobalData readyEntriesWithType:[GlobalData getTypeAt:indexPath.section]] objectAtIndex:indexPath.row] == entry){
                cell.accessoryType = UITableViewCellAccessoryCheckmark;
            }
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
    if(![tableCell.textLabel.text isEqualToString:@"No entries of this type"]){
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
}

-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    if([identifier isEqualToString:@"SelectTemplateSegue"]){
        return ![self errorsInData];
    }
    return YES;
}

// This is a really nasty jumble of conditionals but IT IS FOR THE GOOD OF THE USER.
- (BOOL) errorsInData{
    // Checking that all entries requiring secondaries have them
    
    
    return NO;
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



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
