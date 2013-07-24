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

        NSString *statusType = dictionary[@"status"];
        
        if ([statusType isEqualToString:@"ERROR"]) {
            object.transferStatus = PKTransferStatusError;
        }
        else if ([statusType isEqualToString:@"DOWNLOADING"]) {
            object.transferStatus = PKTransferStatusDownloading;
        }
        else if ([statusType isEqualToString:@"SEEDING"]) {
            object.transferStatus = PKTransferStatusSeeding;
        }
        else if ([statusType isEqualToString:@"COMPLETED"]) {
            object.transferStatus = PKTransferStatusCompleted;
        }
        else if ([statusType isEqualToString:@"IN_QUEUE"]) {
            object.transferStatus = PKTransferStatusQueued;
        }
        else {
            object.transferStatus = PKTransferStatusUnknown;
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
