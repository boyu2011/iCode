//
//  CommitWebViewController.h
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface CommitWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *commitWebView;

- (void) initRepoFullName:(NSString *)repoFullName sha:(NSString *)sha;

@end
