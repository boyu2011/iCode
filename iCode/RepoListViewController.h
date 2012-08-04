//
//  RepoListViewController.h
//  iCode
//
//  Created by Bo Yu on 7/19/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface RepoListViewController : UITableViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (nonatomic, retain) NSMutableArray * repoArray;

- (void) init:(UAGithubEngine *) g isWatched:(BOOL)isWatched;
- (void) initForUnauthenticated:(UAGithubEngine *)g user:(NSString *)user isWatched:(BOOL)isWatched;

@end
