//
//  PKTransfer.m
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

#import "PKTransfer.h"

@implementation PKTransfer

@synthesize uploaded;
@synthesize estimated_time;
@synthesize peers_getting_from_us;
@synthesize extract;
@synthesize current_ratio;
@synthesize size;
@synthesize up_speed;
@synthesize is_seeding;
@synthesize tid;
@synthesize source;
@synthesize subscription_id;
@synthesize status_message;
@synthesize status;
@synthesize down_speed;
@synthesize peers_connected;
@synthesize downloaded;
@synthesize file_id;
@synthesize peers_sending_to_us;
@synthesize percent_done;
@synthesize tracker_message;
@synthesize name;
@synthesize created_at;
@synthesize error_message;
@synthesize save_parent_id;

- (PKTransfer *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.uploaded = @([dictionary[@"uploaded"] longLongValue]);
        self.estimated_time = @([[dictionary valueForKey:@"estimated_time"] intValue]);
        self.peers_getting_from_us = @([[dictionary valueForKey:@"peers_getting_from_us"] intValue]);
        self.extract = @([[dictionary valueForKey:@"extract"] boolValue]);
        self.current_ratio = @([[dictionary valueForKey:@"current_ratio"] floatValue]);
        self.size = @([[dictionary valueForKey:@"size"] longLongValue]);
        self.up_speed = @([[dictionary valueForKey:@"up_speed"] longLongValue]);
        self.is_seeding = @([[dictionary valueForKey:@"is_seeding"] boolValue]);
        self.tid = @([[dictionary valueForKey:@"id"] intValue]);
        self.source = [dictionary valueForKey:@"source"];
        self.subscription_id = @([[dictionary valueForKey:@"subscription_id"] intValue]);
        self.status_message = [dictionary valueForKey:@"status_message"];
        self.status = [dictionary valueForKey:@"status"];
        self.down_speed = @([[dictionary valueForKey:@"down_speed"] longLongValue]);
        self.peers_connected = @([[dictionary valueForKey:@"peers_connected"] intValue]);
        self.downloaded = @([[dictionary valueForKey:@"downloaded"] longLongValue]);
        self.file_id = @([[dictionary valueForKey:@"file_id"] intValue]);
        self.peers_sending_to_us = @([[dictionary valueForKey:@"peers_sending_to_us"] intValue]);
        self.percent_done = @([[dictionary valueForKey:@"percent_done"] intValue]);
        self.tracker_message = [dictionary valueForKey:@"tracker_message"];
        self.name = [dictionary valueForKey:@"name"];
        self.created_at = [dictionary valueForKey:@"created_at"];
        self.error_message = [dictionary valueForKey:@"error_message"];
        self.save_parent_id = @([[dictionary valueForKey:@"save_parent_id"] intValue]);
    }
    
    return self;
}

@end
