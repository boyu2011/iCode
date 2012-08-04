//
//  UserListViewController.h
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface UserListViewController : UITableViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;

-(void) init:(UAGithubEngine *)g login:(NSString *)login isForFollowing:(BOOL)isForFollowing;

@end
