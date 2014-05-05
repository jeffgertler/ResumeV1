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
@synthesize URLresource;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Allow zoom
    self.webViewView.scalesPageToFit = YES;
    
    // Ideally, we want to do this before arriving at this page; however,
    // we also want to make sure we have access to the "root" webpage (as
    // returned by the server)
    URLresource = [NetworkComm sendMessage:[GlobalData stringForServer]];
    URLresource = [URLresource substringWithRange:NSMakeRange(6, [URLresource length]-8)];
    
    rootURL = @"http://latex.wong1275.com/";
    rootURL = [rootURL stringByAppendingString:URLresource];
    rootURL = [rootURL stringByAppendingString:@"/resume.pdf"];
    
    // For debugging purposes only
    NSLog( rootURL );
    
    [self changeURLTo:rootURL];
}

- (void)changeURLTo:(NSString *)url {
    sleep(2);
    [self.webViewView loadRequest:
     [NSURLRequest requestWithURL:[NSURL URLWithString:url]]];
}

@end
