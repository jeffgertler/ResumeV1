//
//  webPreviewViewController.m
//  ResumeV1
//
//  Created by George Wong on 5/1/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "webPreviewViewController.h"

@implementation webPreviewViewController

@synthesize rootURL;

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    
    // Ideally, we want to do this before arriving at this page; however,
    // we also want to make sure we have access to the "root" webpage (as
    // returned by the server)
    
    //[networkComm sendMessage:@"test message"];
    
    //NSLog(@"%@", [NetworkComm sendMessage:@"TST MSG SYS"]);
    

    NSLog([GlobalData stringForServer]);
    
    //rootURL = [NetworkComm sendMessage:@"TST MSG SYS"];
    
    [self changeURLTo:@"http://latex.wong1275.com/"];
}

- (void)changeURLTo:(NSString *)url {
    [self.webViewView loadRequest:
     [NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
