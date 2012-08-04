//
//  IssueDetailViewController.m
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "IssueDetailViewController.h"
#import "IssueWebViewController.h"

@interface IssueDetailViewController ()

@property (nonatomic, retain) NSString * repoFullName;
@property (nonatomic) NSInteger issueNumber;
@property (nonatomic, retain) NSString * issueTitle;
@property (nonatomic, retain) NSString * issueBody;

@end

@implementation IssueDetailViewController

@synthesize githubEngine;
@synthesize titleTextView;
@synthesize issueBodyTextView;
@synthesize repoFullName;
@synthesize issueNumber;
@synthesize issueTitle;
@synthesize issueBody;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)name issueNumber:(NSInteger)issueNumber
{
    self.githubEngine = g;
    self.repoFullName = name;
    self.issueNumber = issueNumber;
    
    //
    // get issue details
    //
    
    [self.githubEngine issue:self.issueNumber inRepository:self.repoFullName success:^(id response) {
        
        //NSLog(@"issue details: %@", response);
        NSMutableArray * issue = response;
        NSDictionary * issueDic = [issue objectAtIndex:0];
        self.issueTitle = [NSString stringWithFormat:@"Title:\n%@", [issueDic valueForKey:@"title"]];
        self.issueBody = [NSString stringWithFormat:@"Body:\n%@", [issueDic valueForKey:@"body"]];
        
        } failure:^(NSError * error) {
        
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowIssueWeb"])
    {
        [segue.destinationViewController init:self.githubEngine repoFullName:self.repoFullName issueNumber:self.issueNumber];
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
    [self.titleTextView setText:self.issueTitle];
    [self.issueBodyTextView setText:self.issueBody];
}

- (void)viewDidUnload
{
    [self setTitleTextView:nil];
    [self setIssueBodyTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
