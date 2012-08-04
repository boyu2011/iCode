//
//  RepoDetailViewController.h
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface RepoDetailViewController : UIViewController

@property (nonatomic, retain) UAGithubEngine * githubEngine;
@property (weak, nonatomic) IBOutlet UIButton * repoFullNameBtn;
@property (weak, nonatomic) IBOutlet UIButton * branchListBtn;
@property (weak, nonatomic) IBOutlet UIButton * commitListBtn;
@property (weak, nonatomic) IBOutlet UITextView * descriptionTextView;
@property (weak, nonatomic) IBOutlet UIButton * pullRequestListBtn;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name;

@end
