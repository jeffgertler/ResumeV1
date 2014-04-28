//
//  templateDetailViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/27/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "templateDetailViewController.h"
#import "GlobalData.h"

@interface templateDetailViewController ()

@end

@implementation templateDetailViewController

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
//    [super viewDidLoad];
//    UIImageView *imgView = [[UIImageView alloc] init];
//    NSString *imgFilepath = [[NSBundle mainBundle] pathForResource:@"template1" ofType:@"png"];
//    UIImage *img = [[UIImage alloc] initWithContentsOfFile:imgFilepath];
//    [imgView setImage:img];
//    [self.view addSubview:imgView];
    
	UIImageView *dot =[[UIImageView alloc] initWithFrame:CGRectMake(0,68,320,500)];
    NSString *imagePath = [NSString stringWithFormat:@"template%d", [GlobalData getTemplateNumber]];
    dot.image= [UIImage imageNamed:imagePath];
    [self.view addSubview:dot];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
