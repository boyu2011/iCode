//
//  MainTabBarViewController.h
//  iCode
//
//  Created by Bo Yu on 7/24/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UAGithubEngine.h"

@interface MainTabBarViewController : UITabBarController

-(void) init:(UAGithubEngine *) g;
@end
