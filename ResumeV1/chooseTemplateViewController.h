//
//  chooseTemplateViewController.h
//  ResumeV1
//
//  Created by Jeffrey Gertler on 4/16/14.
//  Copyright (c) 2014 Jeffrey Gertler. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface chooseTemplateViewController : UIViewController <UICollectionViewDataSource,UICollectionViewDataSource>

- (IBAction)unwindToChooseTemplate:(UIStoryboardSegue *)segue;

@end
