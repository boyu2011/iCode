//
//  UserProfileViewController.h
//  iCode
//
//  Created by Bo Yu on 7/19/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface UserProfileViewController : UIViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (weak, nonatomic) IBOutlet UIButton *nameBtn;
@property (weak, nonatomic) IBOutlet UIButton *followingBtn;
@property (weak, nonatomic) IBOutlet UIButton *followersBtn;
@property (weak, nonatomic) IBOutlet UIButton *reposBtn;
@property (weak, nonatomic) IBOutlet UIButton *watchedReposBtn;
@property (weak, nonatomic) IBOutlet UIButton *blogBtn;

- (void) init:(UAGithubEngine *) g;     // for authenticated user.
- (void) initForUnauthenticated:(UAGithubEngine *)g user:(NSString *)user;

@end
