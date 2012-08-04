//
//  IssueDetailViewController.h
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface IssueDetailViewController : UIViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (weak, nonatomic) IBOutlet UITextView *titleTextView;
@property (weak, nonatomic) IBOutlet UITextView *issueBodyTextView;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name issueNumber:(NSInteger)issueNumber;

@end
