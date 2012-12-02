//
//  PKFile.m
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKFile.h"
#import "NSString+DisplayName.h"

@implementation PKFile

static NSArray *ThumbnailFileTypes;
static NSArray *TextFileTypes;
static NSArray *TextFileNames;
static NSArray *AudioFileTypes;
static NSArray *ImageFileTypes;

+ (void)initialize {
    ThumbnailFileTypes = @[@"mp4", @"mov", @"wmv", @"m4v", @"mkv", @"avi", @"jpg", @"png", @"gif"];

    TextFileTypes = @[ @"txt", @"nfo", @"log", @"diz", @"xml"];
    TextFileNames = @[ @"README", @"LICENSE", @"INSTALL", @"CHANGELOG", @"AUTHORS"];
    ImageFileTypes = @[ @"jpg", @"png", @"gif"];
    AudioFileTypes = @[ @"mp3", @"aac", @"wav", @"auf"];
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary {
    PKFile *object = [super objectWithDictionary:dictionary];

    if (object) {
        if (dictionary[@"is_mp4_available"] != [NSNull null]) {
            object.isMP4Available = @( [dictionary[@"is_mp4_available"] boolValue] );
        }

        object.parentID = [(NSNumber *)dictionary[@"parent_id"] stringValue];
        object.id = [(NSNumber *)object.id stringValue];
        object.displayName = [object.name displayNameString];
    }

    return object;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): %@", NSStringFromClass([self class]), self.id, self.displayName];
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

- (BOOL)isImageType {
    if ([ImageFileTypes containsObject:self.extension]) return YES;
    return NO;
}

- (NSString *)extension {
    return [[self.name pathExtension] lowercaseString];
}

- (BOOL)hasPreviewThumbnail {
    return [ThumbnailFileTypes containsObject:[self extension]];
}

@end
