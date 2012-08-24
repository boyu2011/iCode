//
//  ViewController.m
//  iCode
//
//  Created by Bo Yu on 7/18/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "ViewController.h"
#import "UserProfileViewController.h"
#import "GlobalAuthenticatedUserInfo.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize userId;
@synthesize password;
@synthesize login;  // login button
@synthesize githubEngine = _githubEngine;

//
// This function is called when user clicks the 'login' button.
//

- (IBAction)login:(id)sender {
    
    G_LOGIN = userId.text;
    
    self.githubEngine = [[UAGithubEngine alloc] initWithUsername:self.userId.text password:self.password.text withReachability:YES];
    
    //
    // user has logged successfully:)
    //
    
    [self.githubEngine userWithSuccess:^(id response) {
        
        [self performSegueWithIdentifier:@"ShowUserProfile" sender:self];
        
        } failure:^(NSError * error) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Warning" 
                                                        message:@"Login failed!"
                                                        delegate:nil 
                                                        cancelButtonTitle:@"OK" 
                                                        otherButtonTitles: nil];
            [alert show];
    }];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowUserProfile"])
    {
        [[segue destinationViewController] init:self.githubEngine];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [self setUserId:nil];
    [self setPassword:nil];
    [self setUserId:nil];
    [self setUserId:nil];
    [self setPassword:nil];
    [self setLogin:nil];
    [self setLogin:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

@end
