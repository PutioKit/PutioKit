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

#import <Foundation/NSObject.h>

/**
 This class provides a NSObject subclass in type of PKTransfer.
 */
@interface PKTransfer : NSObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */

/** Uploaded size of file in bytes. */
@property (strong, nonatomic) NSNumber *uploaded;

/** Estimated time to complete download in seconds. */
@property (strong, nonatomic) NSNumber *estimated_time;

/** Number of peers fetching from Put.io. */
@property (strong, nonatomic) NSNumber *peers_getting_from_us;

/** Boolean value to determine automatic extraction after download finishes. */
@property (strong, nonatomic) NSNumber *extract;

/** Decimal value of current seed ratio. */
@property (strong, nonatomic) NSNumber *current_ratio;

/** Size of file in bytes. */
@property (strong, nonatomic) NSNumber *size;

/** Upload speed in bytes per second. */
@property (strong, nonatomic) NSNumber *up_speed;

/** Boolean value to determine if file is seeding by Put.io. */
@property (strong, nonatomic) NSNumber *is_seeding;

/** Transfer id assigned by Put.io. */
@property (strong, nonatomic) NSNumber *tid;

/** Source address of file. */
@property (strong, nonatomic) NSString *source;

/** ID of subscription which file is downloading via. */
@property (strong, nonatomic) NSNumber *subscription_id;

/** Status message of transfer. */
@property (strong, nonatomic) NSString *status_message;

/** Status of transfer. */
@property (strong, nonatomic) NSString *status;

/** Download speed in bytes per second. */
@property (strong, nonatomic) NSNumber *down_speed;

/** Number of peers connected to Put.io. */
@property (strong, nonatomic) NSNumber *peers_connected;

/** Downloaded file size in bytes. */
@property (strong, nonatomic) NSNumber *downloaded;

/** File id assigned by Put.io. */
@property (strong, nonatomic) NSNumber *file_id;

/** Number of peers sending to Put.io. */
@property (strong, nonatomic) NSNumber *peers_sending_to_us;

/** Percent of file has downloaded. */
@property (strong, nonatomic) NSNumber *percent_done;

/** Message sent by tracker. */
@property (strong, nonatomic) NSString *tracker_message;

/** Name of file. */
@property (strong, nonatomic) NSString *name;

/** Creation date of transfer in iso8601 format. */
@property (strong, nonatomic) NSString *created_at;

/** Error message of transfer. */
@property (strong, nonatomic) NSString *error_message;

/** Parent folder id which file will be saved in. */
@property (strong, nonatomic) NSNumber *save_parent_id;

/**---------------------------------------------------------------------------------------
 * @name Instance methods
 *  ---------------------------------------------------------------------------------------
 */
/**
 Initializes an PKTransfer object with given dictionary, returned from API, and returns the instance.
 @param dictionary A NSDictionary object contains data obtained from API.
 @return PKTransfer
 */
- (PKTransfer *)initWithDictionary:(NSDictionary *)dictionary;

@end
