//
//  makeViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/2/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface makeViewController : UIViewController <UINavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
- (IBAction)unwindToMake:(UIStoryboardSegue *)segue;
@property (weak, nonatomic) IBOutlet UINavigationBar *navigationBar;
@property UINavigationBar *navBar;

@end
