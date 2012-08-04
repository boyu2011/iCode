//
//  GlobalAuthenticatedUserInfo.m
//  iCode
//
//  Created by Bo Yu on 7/23/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import "GlobalAuthenticatedUserInfo.h"

@implementation GlobalAuthenticatedUserInfo

@synthesize login;

-(id) init
{
}

-(BOOL)isAuthenticatedUser:(NSString *)login
{
    if(self.login == login)
        return true;
    else
        return false;
}

-(void)setLogin:(NSString *)login
{
    self.login = login;
}

-(NSString *)getLogin
{
    return self.login;
}

@end

// marked for the logged user.
NSString * G_LOGIN = @"";