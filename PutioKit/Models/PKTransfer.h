//
//  PKTransfer.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//


#import "PKObject.h"

typedef enum {
    PKTransferStatusOK,
    PKTransferStatusERROR
} PKTransferStatus;

/**
 This class provides a PKObject subclass in type of PKTransfer.
 */
@interface PKTransfer : PKObject


/**---------------------------------------------------------------------------------------
 * @name Properties
 *  --------------------------------------------------------------------------------------
 */

/** Uploaded size of file in bytes. */
@property (strong, nonatomic) NSNumber *uploaded;

/** Estimated time to complete download in seconds. */
@property (strong, nonatomic) NSNumber *estimatedTime;

/** Number of peers fetching from Put.io. */
@property (strong, nonatomic) NSNumber *peersGettingFromUs;

/** Boolean value to determine automatic extraction after download finishes. */
@property (strong, nonatomic) NSNumber *extract;

/** Decimal value of current seed ratio. */
@property (strong, nonatomic) NSNumber *currentRatio;

/** Size of file in bytes. */
@property (strong, nonatomic) NSNumber *size;

/** Upload speed in bytes per second. */
@property (strong, nonatomic) NSNumber *upSpeed;

/** Boolean value to determine if file is seeding by Put.io. */
@property (strong, nonatomic) NSNumber *isSeeding;

/** Transfer id assigned by Put.io. */
@property (strong, nonatomic) NSNumber *id;

/** Source address of file. */
@property (strong, nonatomic) NSString *source;

/** ID of subscription which file is downloading via. */
@property (strong, nonatomic) NSNumber *subscriptionID;

/** Status message of transfer. */
@property (strong, nonatomic) NSString *statusMessage;

/** Status of transfer. */
@property (strong, nonatomic) NSString *status;

/** Download speed in bytes per second. */
@property (strong, nonatomic) NSNumber *downSpeed;

/** Number of peers connected to Put.io. */
@property (strong, nonatomic) NSNumber *peersConnected;

/** Downloaded file size in bytes. */
@property (strong, nonatomic) NSNumber *downloaded;

/** File id assigned by Put.io. */
@property (strong, nonatomic) NSString *fileID;

/** Number of peers sending to Put.io. */
@property (strong, nonatomic) NSNumber *peersSendingToUs;

/** Percent of file has downloaded. */
@property (strong, nonatomic) NSNumber *percentDone;

/** Message sent by tracker. */
@property (strong, nonatomic) NSString *trackerMessage;

/** Name of file. */
@property (strong, nonatomic) NSString *name;

/** Creation date of transfer in iso8601 format. */
@property (strong, nonatomic) NSString *createdAt;

/** Error message of transfer. */
@property (strong, nonatomic) NSString *errorMessage;

/** Parent folder id which file will be saved in. */
@property (strong, nonatomic) NSNumber *saveParentID;

@property (assign) PKTransferStatus transferStatus;

- (NSString *)displayName;

@end
