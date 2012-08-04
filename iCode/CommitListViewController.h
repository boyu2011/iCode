//
//  CommitListViewController.h
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface CommitListViewController : UITableViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property(nonatomic, retain) NSMutableArray * commitArray;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name;

@end
