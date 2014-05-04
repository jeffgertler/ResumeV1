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
    self.datePicker.delegate = self;
    self.secondaryDatePicker.delegate = self;
    self.days = [[NSMutableArray alloc] initWithObjects:@"-", nil];
    self.months = [[NSMutableArray alloc] init];
    self.years = [[NSMutableArray alloc] init];
    for(int i=1; i<=31; i++){
        [self.days addObject:[NSString stringWithFormat:@"%d", i]];
    }
    self.months = @[@"-", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
	
    for(int i=1900; i<=2020; i++){
        [self.years addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [self.years addObject:@"-"];
    [self.datePicker selectRow:114 inComponent:2 animated:YES];
    [self.secondaryDatePicker selectRow:121 inComponent:2 animated:YES];
    self.times = [[NSMutableArray alloc] initWithObjects:@"-", @"-", @"2014", @"-", @"-", @"-", nil];
}


// Handle type picker
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 3;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent: (NSInteger)component {
    if(component == 0){
        return [self.days count];
    } else if(component == 1) {
        return [self.months count];
    } else {
        return [self.years count];
    }
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    if(component == 0){
        return [self.days objectAtIndex:row];
    } else if(component == 1) {
        return [self.months objectAtIndex:row];
    } else {
        return [self.years objectAtIndex:row];
    }
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row   inComponent:(NSInteger)component {
    if(pickerView.tag == 1){
        if(component == 0){
            [self.times replaceObjectAtIndex:0 withObject:[self.days objectAtIndex:row]];
        } else if(component == 1) {
            [self.times replaceObjectAtIndex:1 withObject:[self.months objectAtIndex:row]];
        } else {
            [self.times replaceObjectAtIndex:2 withObject:[self.years objectAtIndex:row]];
        }
    } else {
        if(component == 0){
            [self.times replaceObjectAtIndex:3 withObject:[self.days objectAtIndex:row]];
        } else if(component == 1) {
            [self.times replaceObjectAtIndex:4 withObject:[self.months objectAtIndex:row]];
        } else {
            [self.times replaceObjectAtIndex:5 withObject:[self.years objectAtIndex:row]];
        }
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
