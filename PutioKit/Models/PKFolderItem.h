//
//  PKFolderItem.h
//  PutioKit
//
//  Created by orta therox on 01/11/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

@protocol PKFolderItem <NSObject>

@property (strong) NSString *id;
@property (strong) NSString *name;
@property (strong) NSString *displayName;
@property (strong) NSNumber *size;
@property (strong) NSString *parentID;

@end
