//
//  checkSecondariesViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/9/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface checkSecondariesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)unwindToCheckSecondaries:(UIStoryboardSegue *)segue;
- (BOOL) errorsInData;

@end
