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
#import "checkSecondariesViewController.h"

@interface makeViewController () 

@property NSMutableArray *addedEntries;

@end

@implementation makeViewController

@synthesize tableView;


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.addedEntries= [[NSMutableArray alloc] init];
    //UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStyleDone target:self action:@selector(nextPressed:)];
    
    self.navBar = [[UINavigationBar alloc] init];
    UINavigationItem *navItem = [[UINavigationItem alloc] initWithTitle:@"Select Information"];
    UIBarButtonItem *Next = [[UIBarButtonItem alloc] initWithTitle:@"Next" style:UIBarButtonItemStylePlain target:self action:@selector(nextPressed:)];
    UIBarButtonItem *Back = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStylePlain target:self action:@selector(backPressed:)];
    navItem.rightBarButtonItem = Next;
    navItem.leftBarButtonItem = Back;
    self.navBar.items = [NSArray arrayWithObject:navItem];
    [self.view addSubview:self.navBar];
}

- (void)viewDidAppear:(BOOL)animated {
    self.navBar.frame = CGRectMake(0, 20, self.view.frame.size.width, 44);
    //[self resetCheckmarks];
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
    
    cell.accessoryType = UITableViewCellAccessoryNone;
    for(Entry *entry in self.addedEntries){
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

- (IBAction)nextPressed:(id)sender {
    [GlobalData setReadyEntries:self.addedEntries];
    [self performSegueWithIdentifier:@"secondariesSegue" sender:sender];
}

- (IBAction)backPressed:(id)sender {
    //[self dismissModalViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:Nil];
}

- (IBAction)unwindToMake:(UIStoryboardSegue *)segue{
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
