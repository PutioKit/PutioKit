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

@property (strong) NSString * id;
@property (strong) NSString * name;
@property (strong) NSString * displayName;
@property (strong) NSString * parentID;
@property (strong) NSString * screenShotURL;
@property (strong) NSNumber * size;

@property (strong) NSSet *items;
- (NSArray *)orderedItems;

@end
