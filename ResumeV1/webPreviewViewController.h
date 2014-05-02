//
//  webPreviewViewController.h
//  ResumeV1
//
//  Created by George Wong on 5/1/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkComm.h"

@interface webPreviewViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIWebView *webViewView;
@property (weak, nonatomic) NSString *rootURL;

- (void)changeURLTo:(NSString *)url;

@end
