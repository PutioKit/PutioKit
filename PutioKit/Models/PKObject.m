//
//  PKObject.m
//  PutioKit
//
//  Created by orta therox on 29/10/2012.
//  Copyright (c) 2012 Ahmet AYGÜN. All rights reserved.
//

#import "PKObject.h"

@implementation PKObject

+ (id)objectWithDictionary:(NSDictionary *)dictionary {
    id object = [[self alloc] init];
    if (object) {
        [object updateObjectWithDictionary:dictionary];
    }
    return object;
}

// This only supports one level of incursion.
- (void)updateObjectWithDictionary:(NSDictionary *)dictionary {
    [self setValuesForKeysWithDictionary:[self camelCaseDictionary:dictionary]];
}


- (NSDictionary *)camelCaseDictionary:(NSDictionary *)dictionary {
    NSMutableDictionary *copy = [NSMutableDictionary dictionary];

    for (id key in dictionary.allKeys) {
        if ([key isKindOfClass:[NSString class]]) {
            NSString *stringKey = key;
            NSArray *underscoredComponents = [stringKey componentsSeparatedByString:@"_"];
            NSMutableString *camelCaseKey = [NSMutableString string];

            // if there's no underscores we've got the right
            // property name anyway

            if (underscoredComponents.count == 0) {
                camelCaseKey = [stringKey mutableCopy];
            } else {

                for (NSString *component in underscoredComponents) {
                    if ([underscoredComponents indexOfObject:component] == 0) {
                        [camelCaseKey appendString:component];

                    } else {
                        NSString *firstLetter = [component substringToIndex:1];
                        [camelCaseKey appendString:[firstLetter uppercaseString]];
                        [camelCaseKey appendString:[component substringFromIndex:1]];
                    }
                }
            }

            if ([self respondsToSelector:[self setSelectorForString:camelCaseKey]]) {
                [copy setValue:dictionary[key] forKey:camelCaseKey];
            }
        }
    }
    
    return copy;
}

- (SEL)setSelectorForString:(NSString *)string {
    NSMutableString *selector = [@"set" mutableCopy];

    NSString *firstLetter = [string substringToIndex:1];
    [selector appendString:[firstLetter uppercaseString]];
    [selector appendString:[string substringFromIndex:1]];
    [selector appendString:@":"];

    return NSSelectorFromString(selector);
}

@end
