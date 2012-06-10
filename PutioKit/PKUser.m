//
//  User.m
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

#import "User.h"

@implementation User

@synthesize user_id;
@synthesize user_name;
@synthesize access_token;
@synthesize api_key;
@synthesize api_secret;

- (User *) initWithDict: (NSDictionary *) dict
{
    self = [super init];
    
    if (self) {
        self.user_id = [dict valueForKey:@"user_id"];
        self.user_name = [dict valueForKey:@"user_name"];
        self.access_token = [dict valueForKey:@"access_token"];
        self.api_key = [dict valueForKey:@"api_key"];
        self.api_secret = [dict valueForKey:@"api_secret"];
    }
    
    return self;
}

@end