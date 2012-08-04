//
//  IssueListViewController.h
//  iCode
//
//  Created by Bo Yu on 7/21/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface IssueListViewController : UITableViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property(nonatomic, retain) NSMutableArray * issueArray;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name;

@end
