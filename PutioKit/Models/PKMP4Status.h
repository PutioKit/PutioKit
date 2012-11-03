//
//  PKMP4Status.h
//  PutioKit
//
//  Created by orta therox on 03/11/2012.
//  Copyright (c) 2012 PutIOKit. All rights reserved.
//

#import "PKObject.h"

typedef enum {
    PKMP4StatusCompleted,
    PKMP4StatusConverting,
    PKMP4StatusQueued,
    PKMP4StatusUnknown
} PKMP4StatusType;

@interface PKMP4Status : PKObject

@property PKMP4StatusType mp4Status;
@property NSNumber *progress;

@end
