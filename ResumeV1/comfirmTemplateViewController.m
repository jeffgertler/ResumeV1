//
//  comfirmTemplateViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/27/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "comfirmTemplateViewController.h"
#import "GlobalData.h"

@interface comfirmTemplateViewController ()

@end

@implementation comfirmTemplateViewController 


- (void)viewDidLoad
{
    [super viewDidLoad];
	UIImageView *image =[[UIImageView alloc] initWithFrame:CGRectMake(50,50,20,20)];
    image.image=[UIImage imageNamed:[NSString stringWithFormat:@"template%d", templateNumber]];
    [self.view addSubview:image];
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
