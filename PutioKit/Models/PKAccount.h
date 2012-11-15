//
//  PKUser.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//

#import <Foundation/NSObject.h>
#import "PKAccountSettings.h"
#import "PKObject.h"

/**
 This class provides a PKObject subclass in type of PKAccount.
 */
@interface PKAccount : PKObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */
/** Username as explained by its name. */
@property (strong, nonatomic) NSString *username;

/** Email address of user. */
@property (strong, nonatomic) NSString *mail;

/** Available disk size in bytes. */
@property (strong, nonatomic) NSNumber *diskAvailable;

/** Used disk size in bytes. */
@property (strong, nonatomic) NSNumber *diskUsed;

/** Disk size of user's paid plan in bytes. */
@property (strong, nonatomic) NSNumber *diskSize;

/** PKAccountSettings instance that holds user's settings. */
@property (strong, nonatomic) PKAccountSettings *settings;

@end