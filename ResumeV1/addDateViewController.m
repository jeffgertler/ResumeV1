//
//  addDateViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 5/3/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "addDateViewController.h"

@interface addDateViewController ()

@end

@implementation addDateViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


// Handle type picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    return ([GlobalData typesSize]+1);
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    if (row < ([GlobalData typesSize])) {
        return [GlobalData getTypeAt:row];
    } else {
        return @"Custom...";
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    if (row < ([GlobalData typesSize])) {
        self.TextField.text = [GlobalData getTypeAt:row];
    } else {
        self.TextField.text = @"";
        self.typePicker.hidden = YES;
        self.TextField.hidden = NO;
    }
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
