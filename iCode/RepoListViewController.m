//
//  RepoListViewController.m
//  iCode
//
//  Created by Bo Yu on 7/19/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "RepoListViewController.h"
#import "BranchListViewController.h"

@interface RepoListViewController ()

@end

@implementation RepoListViewController

@synthesize githubEngine;
@synthesize repoArray;

//
// for authenticated user
//

- (void) init:(UAGithubEngine *)g isWatched:(BOOL)isWatched
{
    self.githubEngine = g;
    
    // for watched repos
    if (isWatched)
    {
        //
        // user's watched repos
        //
        
        [self.githubEngine watchedRepositoriessuccess:^(id response) {
            
            //NSLog(@"repo list: %@", self.repoArray);
            self.repoArray = response;
            
        } failure:^(NSError * error) {
            
        }];
    }
    // for personal repos
    else 
    {
        //
        // get user's repo
        //
        
        [self.githubEngine repositoriesWithSuccess:^(id response) {
            
            //NSLog(@"repo list: %@", self.repoArray);
            self.repoArray = response;
            
        } failure:^(NSError * error) {
            
        }];
    }
}

//
// for unauthenticated user
//

- (void)initForUnauthenticated:(UAGithubEngine *)g user:(NSString *)user isWatched:(BOOL)isWatched
{
    self.githubEngine = g;
    
    if (isWatched)
    {
        //
        // user's repos
        //
        
        [self.githubEngine watchedRepositoriesForUser:user success:^(id response) {
            
            self.repoArray = response;
            
            } failure:^(NSError * error) {
            
        }];
    }
    else 
    {
        //
        // get user's repo
        //
        
        [self.githubEngine repositoriesForUser:user includeWatched:false success:^(id response) {
            
            self.repoArray = response;
            
            } failure:^(NSError * error) {
            
        }];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowRepoDetail"])
    {
        UITableViewCell *cell = (UITableViewCell *)sender;
        NSString * fullName = [[cell textLabel] text];
        [segue.destinationViewController init:self.githubEngine repoFullName:fullName];
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
    return [self.repoArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Repository";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    // Configure the cell...
    NSDictionary * repo = [self.repoArray objectAtIndex:indexPath.row];
    NSString * fullName = [repo valueForKey:@"full_name"];
    cell.textLabel.text = fullName;
    cell.detailTextLabel.text = [repo valueForKey:@"description"];
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
