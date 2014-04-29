//
//  chooseTemplateViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/16/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "chooseTemplateViewController.h"
#import "collectionCell.h"
#import "checkTemplateViewController.h"
#import "GlobalData.h"

@interface chooseTemplateViewController ()

@property NSArray *templateData;
@property collectionCell *selectedCell;
@property int selectedNumber;

@end

@implementation chooseTemplateViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.templateData = [[NSArray alloc] initWithObjects:@"Template1", @"Template2", @"Template3", @"Template4", nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    // _data is a class member variable that contains one array per section.
    return 1;
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    return [self.templateData count];
}

-(UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    collectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TemplateCell" forIndexPath:indexPath];
    cell.cellLabel.text = [self.templateData objectAtIndex:indexPath.row];
    NSString *imagePath = [NSString stringWithFormat:@"template%d", indexPath.row+1];
    cell.cellImage.image = [UIImage imageNamed:imagePath];
    [cell.layer setBorderWidth:2.0f];
    [cell.layer setBorderColor:[UIColor blackColor].CGColor];
    return cell;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    for(int i=0; i<[self.templateData count]; i++){
        collectionCell *cell = (collectionCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        cell.window.backgroundColor = [UIColor blackColor];
        cell.backgroundColor = [UIColor blackColor];
    }
    
    self.selectedCell = (collectionCell *)[collectionView cellForItemAtIndexPath:indexPath];
    self.selectedCell.window.backgroundColor = [UIColor blueColor];
    self.selectedCell.backgroundColor = [UIColor blueColor];
    self.selectedNumber = indexPath.row+1;
    [GlobalData setTemplateNumber: self.selectedNumber];
}

- (IBAction)unwindToChooseTemplate:(UIStoryboardSegue *)segue{
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
