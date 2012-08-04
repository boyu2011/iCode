//
//  CommitDetailViewController.m
//  iCode
//
//  Created by Bo Yu on 7/20/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "CommitDetailViewController.h"
#import "CommitWebViewController.h"

@interface CommitDetailViewController ()

@property(nonatomic, retain) NSString * repoFullName;
@property(nonatomic, retain) NSString * sha;

@end

@implementation CommitDetailViewController

@synthesize githubEngine;
@synthesize commitDetailTextView;
@synthesize repoFullName;
@synthesize sha;

- (void)init:(UAGithubEngine *)g repoFullName:(NSString *)repoFullName sha:(NSString *)sha
{
    self.githubEngine = g;
    self.repoFullName = repoFullName;
    self.sha = sha;
    
    //
    // get commit detail
    //
    
    [self.githubEngine commit:self.sha inRepository:self.repoFullName success:^(id response) {
        
        //....TODO
        //NSLog(@"commit detail: %@", response);
        
    } failure:^(NSError * error) {
    
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowCommitWeb"])
    {
        [segue.destinationViewController initRepoFullName:self.repoFullName sha:sha];
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
    self.commitDetailTextView.text = [NSString stringWithFormat:@"SHA:\n%@", sha];
}

- (void)viewDidUnload
{
    [self setCommitDetailTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
