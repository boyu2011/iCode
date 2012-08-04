//
//  PullRequestWebViewController.h
//  iCode
//
//  Created by Bo Yu on 7/21/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface PullRequestWebViewController : UIViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (weak, nonatomic) IBOutlet UIWebView *pullRequestWebView;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)name pullRequestNumber:(NSInteger)pullRequestNumber;

@end
