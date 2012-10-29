//
//  PKFile.m
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

#import "PKFile.h"

@implementation PKFile

@synthesize isShared;
@synthesize name;
@synthesize screenshot;
@synthesize createdAt;
@synthesize parentID;
@synthesize isMP4Available;
@synthesize contentType;
@synthesize icon;
@synthesize id;
@synthesize size;



+ (id)objectWithDictionary:(NSDictionary *)dictionary {
    PKFile *object = [super objectWithDictionary:dictionary];
    if (object) {
        object.isMP4Available = @( [dictionary[@"is_mp4_available"] boolValue] );
        object.parentID = @( [dictionary[@"parend_id"] boolValue] );
    }
    return object;
}
@end
