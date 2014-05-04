//
//  addEntryViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler & George Wong. All rights reserved.
//

#import "addEntryViewController.h"
#import "addDateViewController.h"

@implementation addEntryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.typePicker.delegate = self;
    self.sections = [[NSArray alloc] initWithObjects:@"Type", @"Header", @"Primary", @"Secondary", nil];
    self.entryData= [[NSMutableArray alloc] initWithCapacity:self.sections.count];
    self.currentSection = 0;
    self.TitleText.title = self.sections[self.currentSection];
    self.TextField.hidden = YES;
    self.typePicker.hidden = NO;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)nextPressed:(id)sender {
    // Handle "type" picker
    if ([self currentSection] == 0) {
        [GlobalData addType:self.TextField.text];
        [self.entryData addObject:self.TextField.text];
        self.TextField.text = @"";
        self.typePicker.hidden = YES;
        self.TextField.hidden = NO;
        self.currentSection++;
        self.TitleText.title = self.sections[self.currentSection];
    } else {
        // Handle other logic
        if(self.currentSection == [self.sections count]-1){
            [self.entryData addObject:self.TextField.text];
            // Get the date from addDate which will unwind to root
            [self performSegueWithIdentifier:@"addDateSegue" sender:sender];
        } else if (![self.TextField.text isEqualToString:nil]){
            [self.entryData addObject:self.TextField.text];
            self.TextField.text = @"";
            self.currentSection++;
            self.TitleText.title = self.sections[self.currentSection];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addDateSegue"]) {
        [Entry entryOfType:self.entryData[0] withHeader:self.entryData[1] andPrimary:self.entryData[2] andSecondary:    self.entryData[3]];
        
        addDateViewController *destViewController = (addDateViewController *)segue.destinationViewController;
        destViewController.entry = [Entry getObjectAt:[Entry entriesSize]-1];
    }
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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
