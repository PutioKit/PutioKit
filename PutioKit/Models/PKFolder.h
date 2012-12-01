//
//  PKFolder.h
//  PutioKit
//
//  Created by orta therox on 01/11/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

#import "PKObject.h"
#import "PKFolderItem.h"

@interface PKFolder : PKObject <PKFolderItem>

/** The folder's ID. */
@property (strong) NSString *id;

/** The folder's name . */
@property (strong) NSString *name;

/** The folder's name that's been de-group'd */
@property (strong) NSString *displayName;

/** Download speed in bytes per second. */
@property (strong) NSString *parentID;

/** Address of the folder's screenshot. */
@property (strong) NSString *screenShotURL;

/** Size of data contained in folder. */
@property (strong) NSNumber *size;

/** Collection of PKFiles and PKFolders held in folder */
@property (strong) NSSet *items;

- (NSArray *)orderedItems;

@end
