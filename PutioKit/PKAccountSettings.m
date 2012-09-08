//
//  PKAccountSettings.m
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

#import "PKAccountSettings.h"

@implementation PKAccountSettings

@synthesize default_download_folder;
@synthesize is_invisible;
@synthesize hide_items_shared;
@synthesize extraction_default;

- (PKAccountSettings *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.default_download_folder = [[[dictionary valueForKey:@"settings"] valueForKey:@"default_download_folder"] integerValue];
        self.is_invisible = [[[dictionary valueForKey:@"settings"] valueForKey:@"is_invisible"] boolValue];
        self.hide_items_shared = [[[dictionary valueForKey:@"settings"] valueForKey:@"hide_items_shared"] boolValue];
        self.extraction_default = [[[dictionary valueForKey:@"settings"] valueForKey:@"extraction_default"] boolValue];
    }
    
    return self;
}

@end
