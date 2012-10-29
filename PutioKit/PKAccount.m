//
//  PKUser.m
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

#import "PKAccount.h"

@implementation PKAccount

@synthesize username;
@synthesize mail;
@synthesize diskAvailable;
@synthesize diskUsed;
@synthesize diskSize;

- (PKAccount *)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.username = [dictionary valueForKey:@"username"];
        self.mail = [dictionary valueForKey:@"mail"];
        self.diskAvailable = @([[[dictionary valueForKey:@"disk"] valueForKey:@"avail"] longLongValue]);
        self.diskUsed = @([[[dictionary valueForKey:@"disk"] valueForKey:@"used"] longLongValue]);
        self.diskSize = @([[[dictionary valueForKey:@"disk"] valueForKey:@"size"] longLongValue]);
        
        @try {
            self.settings = [[PKAccountSettings alloc] initWithDictionary:[dictionary valueForKey:@"settings"]];
        }
        @catch (NSException *exception) {
            NSLog(@"main: Caught %@: %@", [exception name], [exception reason]);
        }
    }
    
    return self;
}

@end