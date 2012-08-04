//
//  GlobalAuthenticatedUserInfo.h
//  iCode
//
//  Created by Bo Yu on 7/23/12.
//  Copyright (c) 2012 Stevens Inst. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GlobalAuthenticatedUserInfo : NSObject

@property(nonatomic, retain) NSString * login;

@end

extern NSString * G_LOGIN;
