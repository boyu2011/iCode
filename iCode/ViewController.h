//
//  ViewController.h
//  iCode
//  User login view controller.
//
//  Created by Bo Yu on 7/18/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface ViewController : UIViewController

@property (retain, nonatomic) IBOutlet UITextField *userId;
@property (retain, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UIButton *login;
@property (retain, nonatomic) UAGithubEngine * githubEngine;

@end
