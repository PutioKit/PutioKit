//
//  PKFile.m
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

#import "PKFile.h"

@implementation PKFile

static NSArray *ThumbnailFileTypes;
static NSArray *TextFileTypes;
static NSArray *TextFileNames;
static NSArray *AudioFileTypes;

+ (void)initialize {
    ThumbnailFileTypes = @[@"mp4", @"mov", @"wmv", @"m4v", @"mkv", @"avi", @"jpg", @"png", @"gif"];

    TextFileTypes = @[ @"txt", @"nfo", @"log", @"diz", @"xml"];
    TextFileNames = @[ @"README", @"LICENSE", @"INSTALL", @"CHANGELOG", @"AUTHORS"];

    AudioFileTypes = @[ @"mp3", @"aac", @"wav", @"auf"];
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary {
    PKFile *object = [super objectWithDictionary:dictionary];

    if (object) {
        object.isMP4Available = @( [dictionary[@"is_mp4_available"] boolValue] );
        object.parentID = @( [dictionary[@"parend_id"] boolValue] );
    }
    object.displayName = [self createDisplayNameFromName:object.name];

    return object;
}

+ (NSString *)createDisplayNameFromName:(NSString *)fullName {
    NSString *display = fullName;

    if (fullName.length > 1) {
        // kill all preceding whitespace
        NSRange range = [display rangeOfString:@"^\\s*" options:NSRegularExpressionSearch];
        display = [display stringByReplacingCharactersInRange:range withString:@""];

        // remove prefix brackets - usually group names
        NSArray *prefixOpeners = @[@"[", @"{", @"("];
        NSArray *prefixClosers = @[@"]", @"}", @")"];
        for (int i = 0; i < prefixClosers.count; i++) {
            if ([[display substringToIndex:1] isEqualToString:prefixOpeners[i]]) {
                display = [display substringFromIndex:[display rangeOfString:prefixClosers[i]].location];
            }
        }

        display = [display lowercaseString];
        display = [display stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"[]{}()"]];

        NSArray *removeStrings = @[@".", @"_", @" 5 1aac ", @" 5.1aac ", @" dvdrip ", @" brrip ", @" x264 ", @" hdtv ", @" 720 ", @" 1080 ", @" 480 ", @" wmv", @" mp4", @" m4v", @" mkv", @" hd ", @" 720p ", @" avi ", @" dvdscr ", @" 1080p ", @" avi"];
        for (NSString *remove in removeStrings) {
            display = [display stringByReplacingOccurrencesOfString:remove withString:@" "];
        }
        display = [display capitalizedString];
    }

    return display;
}

- (BOOL)isTextualType {
    if ([TextFileTypes containsObject:self.extension]) return YES;
    if ([TextFileNames containsObject:self.name]) return YES;
    return NO;
}

- (BOOL)isAudioType {
    if ([AudioFileTypes containsObject:self.extension]) return YES;
    return NO;
}

- (NSString *)extension {
    return [[self.name pathExtension] lowercaseString];
}

- (BOOL)hasPreviewThumbnail {
    return [ThumbnailFileTypes containsObject:[self extension]];
}


@end
