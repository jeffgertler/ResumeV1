//
//  addEntryViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface addEntryViewController : UIViewController <UITextFieldDelegate>

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end