//
//  Item.m
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

#import "Item.h"

@implementation Item

@synthesize item_id;
@synthesize name;
@synthesize type;
@synthesize size;
@synthesize is_dir;
@synthesize parent_id;
@synthesize screenshot_url;
@synthesize thumb_url;
@synthesize file_icon_url;
@synthesize download_url;

- (Item *) initWithDict: (NSDictionary *) dict
{
    self = [super init];
    
    if (self) {
        self.item_id = [dict valueForKey:@"id"];
        self.name = [dict valueForKey:@"name"];
        self.type = [dict valueForKey:@"type"];
        self.size = [dict valueForKey:@"size"];
        self.is_dir = [dict valueForKey:@"is_dir"];
        self.parent_id = [dict valueForKey:@"parent_id"];
        self.screenshot_url = [dict valueForKey:@"screenshot_url"];
        self.thumb_url = [dict valueForKey:@"thumb_url"];
        self.file_icon_url = [dict valueForKey:@"file_icon_url"];
        self.download_url = [dict valueForKey:@"download_url"];
    }
    
    return self;
}

@end