//
//  entryDetailViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/29/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface entryDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *HeaderText;
@property (weak, nonatomic) IBOutlet UITextView *PrimaryText;
@property (weak, nonatomic) IBOutlet UITextView *SecondaryText;
@property Entry *entry;



@end
