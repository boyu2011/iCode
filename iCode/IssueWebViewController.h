//
//  IssueWebViewController.h
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface IssueWebViewController : UIViewController

@property(nonatomic, retain) UAGithubEngine * githubEngine;
@property (weak, nonatomic) IBOutlet UIWebView *issueWebView;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)name issueNumber:(NSInteger)issueNumber;

@end
