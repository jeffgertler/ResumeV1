//
//  addEntryViewController.m
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import "addEntryViewController.h"
#import "Entry.h"

@interface addEntryViewController ()
@property (weak, nonatomic) IBOutlet UITextView *TextField;
@property (weak, nonatomic) IBOutlet UINavigationItem *TitleText;
@property int currentSection;
@property NSArray *sections;
@property NSMutableArray *entryData;


@end

@implementation addEntryViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.sections = [[NSArray alloc] initWithObjects:@"Type", @"Header", @"Primary", @"Secondary", nil];
    self.entryData= [[NSMutableArray alloc] initWithCapacity:self.sections.count];
    self.currentSection = 0;
    self.TitleText.title = self.sections[self.currentSection];
	
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

- (IBAction)nextPressed:(id)sender {
    if(self.currentSection == [self.sections count]-1){
        [self.entryData addObject:self.TextField.text];
        [Entry entryOfType:self.entryData[0] withHeader:self.entryData[1] andPrimary:self.entryData[2] andSecondary:self.entryData[3]];
        [self dismissViewControllerAnimated:YES completion:nil];
    } else if (![self.TextField.text isEqualToString:nil]){
        [self.entryData addObject:self.TextField.text];
        self.TextField.text = @"";
        self.currentSection++;
        self.TitleText.title = self.sections[self.currentSection];
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
