//
//  PKTransfer.h
//  PutioKit
//
//  Copyright (c) 2012 Ahmet AYGÜN
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
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
@property (strong, nonatomic) NSNumber *fileID;

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

@end
