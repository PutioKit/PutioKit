//
//  PKTransfer.m
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKTransfer.h"
#import "PKFile.h"
#import "NSString+DisplayName.h"

@implementation PKTransfer

+ (id)objectWithDictionary:(NSDictionary *)dictionary;
{
    PKTransfer *object = [super objectWithDictionary:dictionary];
    if (object) {
        object.saveParentID = @([dictionary[@"save_parent_id"] intValue]);
        object.fileID = dictionary[@"file_id"];

        if (dictionary[@"error_message"] != [NSNull null]) {
            object.transferStatus = PKTransferStatusERROR;
        }else {
            object.transferStatus = PKTransferStatusOK;
        }
    }
    return object;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"%@ (%@): %@ - %@", NSStringFromClass([self class]), self.id.stringValue, self.name, self.statusMessage];
}

- (NSString *)displayName {
    return [_name displayNameString];
}

@end
