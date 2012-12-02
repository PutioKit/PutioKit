//
//  NSString+DisplayName.m
//  PutioKit
//
//  Created by orta therox on 02/12/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

#import "NSString+DisplayName.h"

@implementation NSString (DisplayName)

- (NSString *)displayNameString {
    NSString *display = self;

    if (self.length > 1) {
        // kill all preceding whitespace
        NSRange range = [display rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
        display = [display stringByReplacingCharactersInRange:range withString:@""];

        // remove prefix brackets ( and their contents ) - usually release group names
        NSArray *prefixOpeners = @[@"[", @"{", @"("];
        NSArray *prefixClosers = @[@"]", @"}", @")"];
        for (int i = 0; i < prefixClosers.count; i++) {
            if ([[display substringToIndex:1] isEqualToString:prefixOpeners[i]]) {
                display = [display substringFromIndex:[display rangeOfString:prefixClosers[i]].location];
            }
        }

        display = [display lowercaseString];
        display = [display stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]{}()"]];

        // Purge more keywords
        NSArray *removeStrings = @[@".", @"_", @" 5 1aac ", @" 5.1aac ", @" dvdrip ", @" brrip ", @" x264 ", @" hdtv ", @" 720 ", @" 1080 ", @" 480 ", @" wmv", @" mp4", @" m4v", @" mkv", @" hd ", @" 720p ", @" avi ", @" dvdscr ", @" 1080p ", @" avi"];
        for (NSString *remove in removeStrings) {
            display = [display stringByReplacingOccurrencesOfString:remove withString:@" "];
        }
        display = [display capitalizedString];
    }
    
    return display;
}

@end
