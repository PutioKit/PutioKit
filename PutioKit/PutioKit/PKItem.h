//
//  PKItem.h
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

@interface PKItem : NSObject
{
    @private
    NSString *item_id;
    NSString *name;
    NSString *type;
    NSString *size;
    NSNumber *is_dir;
    NSString *parent_id;
    NSString *screenshot_url;
    NSString *thumb_url;
    NSString *file_icon_url;
    NSString *download_url;
}

@property (retain) NSString * item_id;
@property (retain) NSString * name;
@property (retain) NSString * type;
@property (retain) NSString * size;
@property (retain) NSNumber * is_dir;
@property (retain) NSString * parent_id;
@property (retain) NSString * screenshot_url;
@property (retain) NSString * thumb_url;
@property (retain) NSString * file_icon_url;
@property (retain) NSString * download_url;

- (PKItem *) initWithDict: (NSDictionary *) dict;

@end