//
//  myClassViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface myClassViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *myTextField;

- (IBAction)unwindToRoot:(UIStoryboardSegue *)segue;
-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender;

// Just for graphics
@property (weak, nonatomic) IBOutlet UIButton *addNewInfoBtn;
@property (weak, nonatomic) IBOutlet UIButton *reviewEntriesBtn;
@property (weak, nonatomic) IBOutlet UIButton *makeBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingsBtn;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


@end
