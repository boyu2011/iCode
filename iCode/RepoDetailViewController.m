//
//  RepoDetailViewController.m
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "RepoDetailViewController.h"
#import "BranchListViewController.h"
#import "PullRequestsViewController.h"
#import "IssueListViewController.h"

@interface RepoDetailViewController ()

@property(nonatomic, retain) NSString * repoFullName;
@property(nonatomic, retain) NSString * description;

@end

@implementation RepoDetailViewController

@synthesize githubEngine;
@synthesize repoFullNameBtn;
@synthesize branchListBtn;
@synthesize commitListBtn;
@synthesize descriptionTextView;
@synthesize pullRequestListBtn;
@synthesize repoFullName;
@synthesize description;

- (void) init:(UAGithubEngine *)g repoFullName:(NSString *)name
{
    self.githubEngine = g;
    self.repoFullName = name;
    
    //
    // get repo detail
    //
    
    [self.githubEngine repository:self.repoFullName success:^(id response) {
        
        //NSLog(@"repo detail: %@", response);
        NSMutableArray * repo = response;
        NSDictionary * repoDic = [repo objectAtIndex:0];
        self.description = [repoDic valueForKey:@"description"];
        
        } failure:^(NSError * error) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowBranchList"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName];
    }
    else if([segue.identifier isEqualToString:@"ShowCommitList"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName];
    }
    else if([segue.identifier isEqualToString:@"ShowPullRequestList"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName];
    }
    else if([segue.identifier isEqualToString:@"ShowIssueList"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName];
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
    [self.repoFullNameBtn setTitle:self.repoFullName forState:UIControlStateNormal];
    [self.descriptionTextView setText:self.description];
    [self.branchListBtn setTitle:@"Branches" forState:UIControlStateNormal];
    [self.commitListBtn setTitle:@"Recent Commits" forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [self setRepoFullNameBtn:nil];
    [self setBranchListBtn:nil];
    [self setCommitListBtn:nil];
    [self setDescriptionTextView:nil];
    [self setPullRequestListBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return true;
}

@end
