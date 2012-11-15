//
//  PKFriend.m
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKFriend.h"

@implementation PKFriend

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ : %@", NSStringFromClass([self class]), self.name];
}


@end
