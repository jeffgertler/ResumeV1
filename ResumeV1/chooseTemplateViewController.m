//
//  chooseTemplateViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/16/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "chooseTemplateViewController.h"

@interface chooseTemplateViewController ()

@property NSMutableArray *templateData;

@end

@implementation chooseTemplateViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
	self.templateData = [[NSMutableArray init] initWithObjects:@"Template1", @"Template2", @"Template3", @"Template4", nil];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView*)collectionView {
    // _data is a class member variable that contains one array per section.
    return [self.templateData count];
}

- (NSInteger)collectionView:(UICollectionView*)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray* sectionArray = [self.templateData objectAtIndex:section];
    return [sectionArray count];
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
