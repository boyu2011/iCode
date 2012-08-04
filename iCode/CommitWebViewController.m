//
//  CommitWebViewController.m
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "CommitWebViewController.h"

@interface CommitWebViewController ()

@property(nonatomic, retain) NSString * repoFullName;
@property(nonatomic, retain) NSString * sha;
@property(nonatomic, retain) NSURL * url;
@property(nonatomic, retain) NSURLRequest * request;

@end

@implementation CommitWebViewController

@synthesize commitWebView;
@synthesize repoFullName;
@synthesize sha;
@synthesize url;
@synthesize request;

- (void) initRepoFullName:(NSString *)repoFullName sha:(NSString *)sha
{
    self.repoFullName = repoFullName;
    self.sha = sha;
    
    // construct a request for browsering.
    NSString * commitURLString = [NSString stringWithFormat:@"https://github.com/%@/commit/%@", self.repoFullName, self.sha];
    self.url = [NSURL URLWithString:commitURLString];
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
    
    // ask for the request.
    [self.commitWebView loadRequest:self.request];
}

- (void)viewDidUnload
{
    [self setCommitWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return true;
}

@end
