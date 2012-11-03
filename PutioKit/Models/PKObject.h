//
//  PKObject.h
//  PutioKit
//
//  Created by orta therox on 29/10/2012.
//  Copyright (c) 2012 Ahmet AYGÜN. All rights reserved.
//


@interface PKObject : NSObject

+ (id)objectWithDictionary:(NSDictionary *)dictionary;
- (void)updateObjectWithDictionary:(NSDictionary *)dictionary;

@end
