//
//  UserBlogWebViewController.m
//  iCode
//
//  Created by Bo Yu on 8/1/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "UserBlogWebViewController.h"

@interface UserBlogWebViewController ()

@property(nonatomic, retain) NSURL * url;
@property(nonatomic, retain) NSURLRequest * request;

@end

@implementation UserBlogWebViewController

@synthesize blogWebView;
@synthesize url;
@synthesize request;

- (void)initWithUserURL:(NSString *)url
{
    //
    // construct a url.
    //
    
    self.url = [NSURL URLWithString:url];
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
    [self.blogWebView loadRequest:self.request];
}

- (void)viewDidUnload
{
    [self setBlogWebView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
