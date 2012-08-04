//
//  BranchListViewController.h
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface BranchListViewController : UITableViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (nonatomic, retain) NSMutableArray * branchArray;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name;

@end
