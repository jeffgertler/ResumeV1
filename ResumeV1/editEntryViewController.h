//
//  editEntryViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/9/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"

@interface editEntryViewController : UIViewController

@property Entry *entry;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
