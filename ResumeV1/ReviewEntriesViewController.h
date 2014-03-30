//
//  reviewEntriesViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 3/26/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface reviewEntriesViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *validTypes;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

- (IBAction)unwindToRoot:(UIStoryboardSegue *)segue;


@end
