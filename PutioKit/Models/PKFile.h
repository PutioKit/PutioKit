//
//  PKFile.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKObject.h"
@class PKFolder;

/**
 This class provides a PKObject subclass in type of PKFile.
 */
@interface PKFile : PKObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */

/** Boolean value to determine file is shared. */
@property (strong, nonatomic) NSNumber *isShared;

/** Name of file. */
@property (strong, nonatomic) NSString *name;

/** A de-[WAREZ](Grouped)NAME.zip of file. */
@property (strong, nonatomic) NSString *displayName;

/** URL string of screenshot of file. */
@property (strong, nonatomic) NSString *screenshotURL;

/** Creation date of file in iso8601 format. */
@property (strong, nonatomic) NSString *createdAt;

/** ID of the parent folder. */
@property (strong, nonatomic) NSNumber *parentID;

/** Boolean value to determine is MP4 available. */
@property (strong, nonatomic) NSNumber *isMP4Available;

/** Content-type of file. */
@property (strong, nonatomic) NSString *contentType;

/** URL string of icon of file. */
@property (strong, nonatomic) NSString *icon;

/** ID of file. */
@property (strong, nonatomic) NSString *id;

/** File size in bytes. */
@property (strong, nonatomic) NSNumber *size;

/** Folder containing the File. */
@property (strong, nonatomic) PKFolder *folder;

+ (NSString *)createDisplayNameFromName:(NSString *)fullName;

- (NSString *)extension;
- (BOOL)hasPreviewThumbnail;
- (BOOL)isTextualType;
- (BOOL)isAudioType;

@end
