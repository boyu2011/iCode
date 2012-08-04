//
//  PullRequestDetailViewController.m
//  iCode
//
//  Created by Bo Yu on 7/21/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "PullRequestDetailViewController.h"
#import "PullRequestWebViewController.h"

@interface PullRequestDetailViewController ()

@property (nonatomic, retain) NSString * repoFullName;
@property (nonatomic) NSInteger pullRequestNumber;
@property (nonatomic, retain) NSString * pullRequestTitle;
@property (nonatomic, retain) NSString * pullRequestBody;

@end

@implementation PullRequestDetailViewController

@synthesize githubEngine;
@synthesize titleTextView;
@synthesize bodyTextView;
@synthesize repoFullName;
@synthesize pullRequestNumber;
@synthesize pullRequestTitle;
@synthesize pullRequestBody;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)name pullRequestNumber:(NSInteger)pullRequestNumber
{
    self.githubEngine = g;
    self.repoFullName = name;
    self.pullRequestNumber = pullRequestNumber;
    
    [self.githubEngine pullRequest:self.pullRequestNumber forRepository:self.repoFullName success:^(id response) {
    
        //NSLog(@"repo detail: %@", response);
        NSMutableArray * pullRequest = response;
        NSDictionary * pullRequestDic = [pullRequest objectAtIndex:0];
        self.pullRequestTitle = [NSString stringWithFormat:@"Title:\n%@",[pullRequestDic valueForKey:@"title"]];
        self.pullRequestBody = [NSString stringWithFormat:@"Body:\n%@",[pullRequestDic valueForKey:@"body"]];
        
        } failure:^(NSError * error) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowPullRequestWeb"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName pullRequestNumber:self.pullRequestNumber];
    }
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
    [self.titleTextView setText:self.pullRequestTitle];
    [self.bodyTextView setText:self.pullRequestBody];
}

- (void)viewDidUnload
{
    [self setTitleTextView:nil];
    [self setBodyTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
