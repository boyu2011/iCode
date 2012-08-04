//
//  UserBlogWebViewController.h
//  iCode
//
//  Created by Bo Yu on 8/1/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserBlogWebViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *blogWebView;

- (void) initWithUserURL:(NSString *)url;

@end
