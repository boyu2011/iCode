//
//  UserListViewController.m
//  iCode
//
//  Created by Bo Yu on 7/22/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "UserListViewController.h"
#import "UserProfileViewController.h"
#import "GlobalAuthenticatedUserInfo.h"

@interface UserListViewController ()

@property(nonatomic, retain) NSMutableArray * userArray;
@property(nonatomic, retain) NSString * login;

@end

@implementation UserListViewController

@synthesize githubEngine;
@synthesize userArray;
@synthesize login;

- (void) init:(UAGithubEngine *)g login:(NSString *)login isForFollowing:(BOOL)isForFollowing
{
    self.githubEngine = g;
    self.login = login;
    
    if(isForFollowing)
    {
        [self.githubEngine following:self.login success:^(id response) {
            
            //NSLog(@"following list: %@", response);
            self.userArray = response;
            
            } failure:^(NSError * error) {
            
        }];
    }
    // for followers
    else 
    {
        [self.githubEngine followers:self.login success:^(id response) {
            
            //NSLog(@"followers list: %@", response);
            self.userArray = response;

            } failure:^(NSError * error) {
            
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{    
    if([segue.identifier isEqualToString:@"ShowUserProfile"])
    {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSString * loginn = [[cell textLabel] text];
        
        // for authenticated (logged in) user
        if([loginn isEqualToString:G_LOGIN])
            [[segue destinationViewController] init:self.githubEngine];
        // for unauthenticated user
        else
            [[segue destinationViewController] initForUnauthenticated:self.githubEngine user:loginn];
    }
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    //return (interfaceOrientation == UIInterfaceOrientationPortrait);
    return TRUE;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.userArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"User";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSDictionary * user = [self.userArray objectAtIndex:indexPath.row];
    NSString * loginString = [user valueForKey:@"login"];
    cell.textLabel.text = loginString;
    // image
    NSString * avatarUrlString = [user valueForKey:@"avatar_url"];
    NSURL * userImageUrl = [NSURL URLWithString:avatarUrlString];
    NSData * userImageData = [NSData dataWithContentsOfURL:userImageUrl];
    cell.imageView.image = [UIImage imageWithData:userImageData];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
