//
//  PKFriend.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKObject.h"

/**
 This class provides a PKObject subclass in type of PKFriend.
 */
@interface PKFriend : PKObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */
/** Username of friend. */
@property (strong, nonatomic) NSString *name;

@end
