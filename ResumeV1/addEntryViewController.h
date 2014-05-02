//
//  addEntryViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Entry.h"
#import "GlobalData.h"

@interface addEntryViewController : UIViewController <UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UITextView *TextField;
@property (weak, nonatomic) IBOutlet UINavigationItem *TitleText;
@property int currentSection;
@property NSArray *sections;
@property NSMutableArray *entryData;
@property (weak, nonatomic) IBOutlet UIPickerView *typePicker;

- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
