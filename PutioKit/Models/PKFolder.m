//
//  PKFolder.m
//  PutioKit
//
//  Created by orta therox on 01/11/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

#import "PKFolder.h"
#import "PKFile.h"

@implementation PKFolder

- (NSArray *)orderedItems {
    return [_items.allObjects sortedArrayUsingComparator:^(NSObject <PKFolderItem>* a, NSObject <PKFolderItem>* b) {
        return [a.name localizedStandardCompare:b.name];
    }];
}

+ (id)objectWithDictionary:(NSDictionary *)dictionary; {
    PKFolder *object = [super objectWithDictionary:dictionary];
    if (object) {
        object.screenShotURL =  dictionary[@"icon"];
        object.parentID = [dictionary[@"parent_id"] stringValue];
        object.displayName = [PKFile createDisplayNameFromName:object.name];
    }
    return object;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): %@", NSStringFromClass([self class]), self.id, self.displayName];
}

@end
