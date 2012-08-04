//
//  IssueWebViewController.m
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "IssueWebViewController.h"

@interface IssueWebViewController ()

@property(nonatomic, retain) NSURL * url;
@property(nonatomic, retain) NSURLRequest * request;

@end

@implementation IssueWebViewController

@synthesize githubEngine;
@synthesize issueWebView;
@synthesize url;
@synthesize request;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name issueNumber:(NSInteger)issueNumber
{
    self.githubEngine = g;
    
    //
    // construct issue url
    //
    
    NSString * urlString = [NSString stringWithFormat:@"https://github.com/%@/issues/%@", name, [NSString stringWithFormat:@"%d", issueNumber]];
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
    
    [self.issueWebView loadRequest:self.request];
}

- (void)viewDidUnload
{
    [self setIssueWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
