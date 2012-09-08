//
//  PKUser.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//  
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//  
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/NSObject.h>
#import "PKAccountSettings.h"

/**
 This class provides a NSObject subclass in type of PKAccount.
 */
@interface PKAccount : NSObject

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

/**---------------------------------------------------------------------------------------
 * @name Instance methods
 *  ---------------------------------------------------------------------------------------
 */
/**
 Initializes an PKAccount object with given dictionary, returned from API, and returns the instance.
 @param dictionary A NSDictionary object contains data obtained from API.
 @return PKAccount
 @warning *Important:* Needs better error handling. Identification of exception must done and should act properly.
 */
- (PKAccount *)initWithDictionary:(NSDictionary *)dictionary;

@end