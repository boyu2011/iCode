//
//  UserProfileViewController.m
//  iCode
//
//  Created by Bo Yu on 7/19/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "UserProfileViewController.h"
#import "RepoListViewController.h"
#import "UserListViewController.h"
#import "GlobalAuthenticatedUserInfo.h"
#import "UserBlogWebViewController.h"

@interface UserProfileViewController ()

@property(nonatomic) NSString * name;
@property(nonatomic) NSString * login;
@property(nonatomic) NSString * following;
@property(nonatomic) NSString * followers;
@property(nonatomic) NSString * repos;
@property(nonatomic) NSString * watchedRepos;
@property(nonatomic) NSString * avatar_url;
@property(nonatomic) NSString * blog;

@end

@implementation UserProfileViewController

@synthesize githubEngine;
@synthesize nameBtn;
@synthesize followingBtn;
@synthesize followersBtn;
@synthesize reposBtn;
@synthesize watchedReposBtn;
@synthesize blogBtn;
@synthesize name;
@synthesize login;
@synthesize following;
@synthesize followers;
@synthesize repos;
@synthesize watchedRepos;
@synthesize avatar_url;
@synthesize blog;

//
// for authenticated user.
//

- (void)init:(UAGithubEngine *)g
{
    self.githubEngine = g;
    
    //
    // user's detail
    //
    
    [self.githubEngine userWithSuccess:^(id response) {
        
        /*
        NSLog(@"user: %@", response);
        if([response isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"NSDictionary");
        }
        else if([response isKindOfClass:[NSArray class]])
        {
            NSLog(@"NSArray");
        }
         */
        
        NSMutableArray * userArray = [NSMutableArray arrayWithArray:response];
        //NSLog(@"userArray:%@", userArray);
        NSLog(@"user0 detail!!: %@", [userArray objectAtIndex:0]);
        NSMutableDictionary *user0Dic = [NSMutableDictionary dictionaryWithDictionary:[userArray objectAtIndex:0]];
        self.name = [user0Dic objectForKey:@"name"];
        self.avatar_url = [user0Dic objectForKey:@"avatar_url"];
        self.login = [user0Dic objectForKey:@"login"];
        
        id b = [user0Dic objectForKey:@"blog"];
        if([b isKindOfClass:[NSString class]])
        {
            self.blog = (NSString *)b;
        }
        else 
        {
            self.blog = @"Blog: NULL";
        }
        
        NSInteger * followingCount = [[user0Dic objectForKey:@"following"] integerValue];
        self.following = [NSString stringWithFormat:@"Following: %d", followingCount];
        NSInteger * followersCount = [[user0Dic objectForKey:@"followers"] integerValue];
        self.followers = [NSString stringWithFormat:@"Followers: %d", followersCount];
        
        } failure:^(NSError * error) {
        
    }];
}

//
// for unauthenticated user.
//

- (void) initForUnauthenticated:(UAGithubEngine *)g user:(NSString *)user
{
    self.githubEngine = g;
    
    //
    // user's detail
    //
    
    [self.githubEngine user:user success:^(id response) {

        NSMutableArray * userArray = [NSMutableArray arrayWithArray:response];
        NSUInteger c = [userArray count];
        NSMutableDictionary *user0Dic = [NSMutableDictionary dictionaryWithDictionary:[userArray objectAtIndex:0]];
        
        self.name = [user0Dic objectForKey:@"name"];
        self.avatar_url = [user0Dic objectForKey:@"avatar_url"];
        self.login = [user0Dic objectForKey:@"login"];
        id b = [user0Dic objectForKey:@"blog"];
        if([b isKindOfClass:[NSString class]])
        {
            self.blog = (NSString *)b;
        }
        else 
        {
            self.blog = @"Blog: NULL";
        }
        
        NSInteger * followingCount = [[user0Dic objectForKey:@"following"] integerValue];
        following = [NSString stringWithFormat:@"Following: %d", followingCount];
        NSInteger * followersCount = [[user0Dic objectForKey:@"followers"] integerValue];
        followers = [NSString stringWithFormat:@"Followers: %d", followersCount];
        
        } failure:^(NSError * error) {

    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowRepoList"])
    {
        if([self.login isEqualToString:G_LOGIN])
            [[segue destinationViewController] init:self.githubEngine isWatched:false];
        else 
            [[segue destinationViewController] initForUnauthenticated:self.githubEngine user:self.login isWatched:false];
    }
    else if([segue.identifier isEqualToString:@"ShowWatchedRepoList"])
    {
        if([self.login isEqualToString:G_LOGIN])
            [[segue destinationViewController] init:self.githubEngine isWatched:true];
        else
            [[segue destinationViewController] initForUnauthenticated:self.githubEngine user:self.login
                isWatched:true];
    }
    else if([segue.identifier isEqualToString:@"ShowFollowing"])
    {
        [[segue destinationViewController] init:self.githubEngine login:self.login isForFollowing:true];
    }
    else if([segue.identifier isEqualToString:@"ShowFollowers"])
    {
        [[segue destinationViewController] init:self.githubEngine login:self.login
            isForFollowing:false];
    }
    else if([segue.identifier isEqualToString:@"ShowUserBlog"])
    {
        [[segue destinationViewController] initWithUserURL:self.blogBtn.titleLabel.text];
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

// This funciton will be called after init().

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    [nameBtn setTitle:self.name forState:UIControlStateNormal];
    NSURL * userImageUrl = [NSURL URLWithString:self.avatar_url];
    NSData * userImageData = [NSData dataWithContentsOfURL:userImageUrl];
    [nameBtn setImage:[UIImage imageWithData:userImageData] forState:UIControlStateNormal];
    nameBtn.imageView.contentMode = UIViewContentModeScaleAspectFit;
    [blogBtn setTitle:self.blog forState:UIControlStateNormal];
    [followingBtn setTitle:following forState:UIControlStateNormal];
    [followersBtn setTitle:followers forState:UIControlStateNormal];
    
    if([self.login isEqualToString:G_LOGIN])
        self.repos = @"My Repositories";
    else 
        self.repos = @"Repositories";
    [reposBtn setTitle:self.repos forState:UIControlStateNormal];
    
    if([self.login isEqualToString:G_LOGIN])
        self.watchedRepos = @"My watched Repositories";
    else 
        self.watchedRepos = @"Watched Repositories";    
    [watchedReposBtn setTitle:self.watchedRepos forState:UIControlStateNormal];
}

- (void)viewDidUnload
{
    [self setNameBtn:nil];
    [self setFollowingBtn:nil];
    [self setFollowersBtn:nil];
    [self setReposBtn:nil];
    [self setWatchedReposBtn:nil];
    [self setBlogBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

@end
