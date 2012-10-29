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

- (void)updateObjectWithDictionary:(NSDictionary *)dictionary {
    for (id key in dictionary.allKeys) {
        // Test for a property with that key

        if ([key isKindOfClass:[NSString class]]) {
            SEL propertySelector = [self underscoredStringtoPropertySelector:key];
            SEL setPropertySelector = [self propertySelectorToSetPropertySelector:propertySelector];

            if ([self respondsToSelector:propertySelector] && [self respondsToSelector:setPropertySelector]) {
                // research this warning.
                [self performSelector:setPropertySelector withObject:dictionary[key]];
            }
        }

        // Recurse if it's a dictionary
        if ([dictionary[key] isKindOfClass:[NSDictionary dictionary]]) {
            [self updateObjectWithDictionary:dictionary[key]];
        }

    }
}

- (SEL)underscoredStringtoPropertySelector:(NSString *)rubyCase {
    NSArray *underscoredComponents = [rubyCase componentsSeparatedByString:@"_"];
    NSMutableString *camelCaseSelectorString = [NSMutableString string];

    // if there's no underscores we've got the right
    // selector name anyway.

    if (underscoredComponents.count == 0) {
        return NSSelectorFromString(rubyCase);
    } else {

        // All components need to be uppercase
        for (NSString *component in underscoredComponents) {
            if ([underscoredComponents indexOfObject:component] == 0) {
                [camelCaseSelectorString appendString:component];

            } else {
                NSString *firstLetter = [component substringToIndex:0];
                [camelCaseSelectorString appendString:[firstLetter uppercaseString]];
                [camelCaseSelectorString appendString:[component substringFromIndex:1]];
            }
        }
    }
    return NSSelectorFromString(camelCaseSelectorString);
}

- (SEL)propertySelectorToSetPropertySelector:(SEL)propertySelector {
    NSString *selector = NSStringFromSelector(propertySelector);
    NSMutableString *setPropertySelector = [NSMutableString stringWithString:@"set"];
    NSString *firstLetter = [[selector substringToIndex:0] uppercaseString];
    [setPropertySelector appendFormat:@"%@%@", firstLetter, [selector substringFromIndex:1]];
    
    return NSSelectorFromString(setPropertySelector);
}


@end
