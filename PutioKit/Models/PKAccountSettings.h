//
//  PKAccountSettings.h
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

/**
 This class provides a NSObject subclass in type of PKAccountSettings.
 */
@interface PKAccountSettings : PKObject

/**---------------------------------------------------------------------------------------
 * @name Properties
 *  ---------------------------------------------------------------------------------------
 */
/** ID of folder that downloaded files put in by default. */
@property (nonatomic) NSNumber *defaultDownloadFolder;

/** Boolean value that defines user is invisible in sharing page. */
@property (nonatomic) NSNumber *isInvisible;

/** Boolean value that defines "items shared with you" folder is visible or not. */
@property (nonatomic) NSNumber *hideItemsShared;

/** Boolean value that defines extraction of downloaded files is enabled by default or not. */
@property (nonatomic) NSNumber *extractionDefault;

@end
