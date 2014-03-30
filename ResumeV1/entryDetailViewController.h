//
//  entryDetailViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/29/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface entryDetailViewController : UIViewController
@property (strong, nonatomic) NSArray *validTypes;
@property (weak, nonatomic) IBOutlet UITextView *HeaderText;
@property (weak, nonatomic) IBOutlet UITextView *PrimaryText;
@property (weak, nonatomic) IBOutlet UITextView *SecondaryText;
@property NSString *header;
@property NSString *primary;
@property NSString *secondary;



@end
