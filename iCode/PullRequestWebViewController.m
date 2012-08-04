//
//  PullRequestWebViewController.m
//  iCode
//
//  Created by Bo Yu on 7/21/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "PullRequestWebViewController.h"

@interface PullRequestWebViewController ()

@property(nonatomic, retain) NSURL * url;
@property(nonatomic, retain) NSURLRequest * request;

@end

@implementation PullRequestWebViewController

@synthesize githubEngine;
@synthesize pullRequestWebView;
@synthesize url;
@synthesize request;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)name pullRequestNumber:(NSInteger)pullRequestNumber
{
    self.githubEngine = g;
    
    //
    // contruct a url request.
    //
    
    NSString * urlString = [NSString stringWithFormat:@"https://github.com/%@/pull/%@", name, [NSString stringWithFormat:@"%d", pullRequestNumber]];
    self.url = [NSURL URLWithString:urlString];
    self.request = [NSURLRequest requestWithURL:self.url];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    // perform the request.
    [self.pullRequestWebView loadRequest:self.request];
}

- (void)viewDidUnload
{
    [self setPullRequestWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
