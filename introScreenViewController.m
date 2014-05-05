//
//  introScreenViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 5/4/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "introScreenViewController.h"
#import "GlobalData.h"

@interface introScreenViewController ()

@end

@implementation introScreenViewController

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
    self.view.backgroundColor = Rgb2UIColor(0, 0, 0);
}

- (void)viewDidAppear:(BOOL)animated{
    sleep(1);
    [self performSegueWithIdentifier:@"IntroSegue" sender:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
