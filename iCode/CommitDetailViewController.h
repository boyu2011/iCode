//
//  CommitDetailViewController.h
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface CommitDetailViewController : UIViewController

@property(nonatomic, retain) UAGithubEngine *githubEngine;
@property (weak, nonatomic) IBOutlet UITextView *commitDetailTextView;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)repoFullName sha:(NSString *)sha;

@end
