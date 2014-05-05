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
    
    // Creating and populating arrays for display
    self.days = [[NSMutableArray alloc] initWithObjects:@"—", nil];
    self.months = [[NSMutableArray alloc] init];
    self.years = [[NSMutableArray alloc] init];
    for(int i=1; i<=31; i++){
        [self.days addObject:[NSString stringWithFormat:@"%d", i]];
    }
    self.months = @[@"—", @"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
	
    for(int i=1900; i<=2020; i++){
        [self.years addObject:[NSString stringWithFormat:@"%d", i]];
    }
    [self.years addObject:@"—"];
    
    // Moving the date selector to the correct starting positions
    if(self.cameFromEditEntry){
        self.times = [NSMutableArray arrayWithArray:[self.entry getTimes]];
        if([self.times[0] isEqualToString:@""]){ [self.datePicker selectRow:0 inComponent:0 animated:YES];
        } else { [self.datePicker selectRow:[self.times[0] intValue] inComponent:0 animated:YES];}
        if([self.times[1] isEqualToString:@""]){ [self.datePicker selectRow:0 inComponent:1 animated:YES];
        } else { [self.datePicker selectRow:([self.months indexOfObject:self.times[1]]) inComponent:1 animated:YES];}
        if([self.times[2] isEqualToString:@""]){ [self.datePicker selectRow:121 inComponent:2 animated:YES];
        } else { [self.datePicker selectRow:([self.times[2] intValue]-1900) inComponent:2 animated:YES];}
        if([self.times[3] isEqualToString:@""]){ [self.secondaryDatePicker selectRow:0 inComponent:0 animated:YES];
        } else { [self.secondaryDatePicker selectRow:[self.times[3] intValue] inComponent:0 animated:YES];}
        if([self.times[4] isEqualToString:@""]){ [self.secondaryDatePicker selectRow:0 inComponent:1 animated:YES];
        } else { [self.secondaryDatePicker selectRow:([self.months indexOfObject:self.times[4]]) inComponent:1 animated:YES];}
        if([self.times[5] isEqualToString:@""]){ [self.secondaryDatePicker selectRow:121 inComponent:2 animated:YES];
        } else { [self.secondaryDatePicker selectRow:([self.times[5] intValue]-1900) inComponent:2 animated:YES];}
    } else {
        [self.datePicker selectRow:114 inComponent:2 animated:YES];
        [self.secondaryDatePicker selectRow:121 inComponent:2 animated:YES];
        self.times = [[NSMutableArray alloc] initWithObjects:@"-", @"-", @"2014", @"-", @"-", @"-", nil];
    }
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
    //Checking to see if the entry doesn't need a date
    if([self.entry.type isEqualToString:@"Contact"]){
        [self.entry setTime:@[@"", @"", @"", @"", @"", @""]];
        [self dismissViewControllerAnimated: YES completion: nil];
    }
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



- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel* tView = (UILabel*)view;
    if (!tView)
    {
        tView = [[UILabel alloc] init];
        [tView setFont:[UIFont fontWithName:@"Helvetica" size:14]];
        //[tView setTextAlignment:UITextAlignmentLeft];
        tView.numberOfLines=3;
    }
    
    if(component == 0){
        tView.text = [self.days objectAtIndex:row];
        tView.textAlignment = NSTextAlignmentRight;
    } else if(component == 1) {
        tView.text = [self.months objectAtIndex:row];
        tView.textAlignment = NSTextAlignmentCenter;
    } else {
        tView.text = [self.years objectAtIndex:row];
    }
    
    return tView;
}

/*
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row   forComponent:(NSInteger)component {
    if(component == 0){
        return [self.days objectAtIndex:row];
    } else if(component == 1) {
        return [self.months objectAtIndex:row];
    } else {
        return [self.years objectAtIndex:row];
    }
} */


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

- (IBAction)donePressed:(id)sender {
    for(int i=0; i<[self.times count]; i++){
        if([self.times[i] isEqualToString:@"-"]){
            self.times[i] = @"";
        }
    }
    [self.entry setTime:self.times];
    [self dismissViewControllerAnimated: YES completion: nil];
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
