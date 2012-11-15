//
//  PKUser.m
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//

#import "PKAccount.h"

@implementation PKAccount

+ (id)objectWithDictionary:(NSDictionary *)dictionary;
{
    PKAccount *object = [super objectWithDictionary:dictionary];
    if (object) {
        object.settings = [PKAccountSettings objectWithDictionary:dictionary[@"settings"]];
        
        object.diskAvailable = @([dictionary[@"disk"][@"avail"] longLongValue]);
        object.diskUsed      = @([dictionary[@"disk"][@"used"] longLongValue]);
        object.diskSize      = @([dictionary[@"disk"][@"size"] longLongValue]);
    }
    return object;
}

@end