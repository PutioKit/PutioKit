//
//  PKAccountSettings.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKObject.h"

/**
 This class provides a NSObject subclass in type of PKAccountSettings.
 */
@interface PKAccountSettings : PKObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */
/** ID of folder that downloaded files put in by default. */
@property (strong, nonatomic) NSNumber *defaultDownloadFolder;

/** Boolean value that defines user is invisible in sharing page. */
@property (strong, nonatomic) NSNumber *isInvisible;

/** Boolean value that defines "items shared with you" folder is visible or not. */
@property (strong, nonatomic) NSNumber *hideItemsShared;

/** Boolean value that defines extraction of downloaded files is enabled by default or not. */
@property (strong, nonatomic) NSNumber *extractionDefault;

@end
