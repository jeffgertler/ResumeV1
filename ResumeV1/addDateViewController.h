//
//  addDateViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 5/3/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GlobalData.h"
#import "Entry.h"

@interface addDateViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>

@property (weak, nonatomic) IBOutlet UIPickerView *datePicker;
@property (weak, nonatomic) IBOutlet UIPickerView *secondaryDatePicker;

@end
