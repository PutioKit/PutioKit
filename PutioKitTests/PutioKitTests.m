//
//  PutioKitTests.m
//  PutioKitTests
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

#import "PutioKitTests.h"

@implementation PutioKitTests

- (void)setUp
{
    [super setUp];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testPKAccount
{
    PKAccount *account = nil;

    NSMutableDictionary *accountDiskDict = [[NSMutableDictionary alloc] init];
    [accountDiskDict setValue:[NSNumber numberWithLongLong:20849243836] forKey:@"avail"];
    [accountDiskDict setValue:[NSNumber numberWithLongLong:32837847364] forKey:@"used"];
    [accountDiskDict setValue:[NSNumber numberWithLongLong:53687091200] forKey:@"size"];
    
    NSMutableDictionary *accountDict = [[NSMutableDictionary alloc] init];
    [accountDict setValue:@"TestUser" forKey:@"username"];
    [accountDict setValue:@"test@user.com" forKey:@"mail"];
    [accountDict setValue:accountDiskDict forKey:@"disk"];
    
    account = [[PKAccount alloc] init];
    STAssertNotNil(account, @"Could not create PKAccount object with init method.");
    STAssertNil(account.username, @"account.username must be nil when initialized with init method.");
    STAssertNil(account.mail, @"account.mail must be nil when initialized with init method.");
    STAssertNil(account.diskAvailable, @"account.diskAvailable must be nil when initialized with init method.");
    STAssertNil(account.diskUsed, @"account.diskUsed must be nil when initialized with init method.");
    STAssertNil(account.diskSize, @"account.diskSize must be nil when initialized with init method.");

    account = [[PKAccount alloc] initWithDictionary:accountDict];
    STAssertNotNil(account, @"Could not create PKAccount object with initWithDictionary method.");
    STAssertEquals(account.username, [accountDict valueForKey:@"username"], @"account.username and given username not equals.");
    STAssertEquals(account.mail, [accountDict valueForKey:@"mail"], @"account.mail and given mail not equals.");
    STAssertEquals([account.diskAvailable longLongValue], [[[accountDict valueForKey:@"disk"] valueForKey:@"avail"] longLongValue], @"account.diskAvailable and given diskAvailable not equals.");
    STAssertEquals([account.diskUsed longLongValue], [[[accountDict valueForKey:@"disk"] valueForKey:@"used"] longLongValue], @"account.diskUsed and given diskUsed not equals.");
    STAssertEquals([account.diskSize longLongValue], [[[accountDict valueForKey:@"disk"] valueForKey:@"size"] longLongValue], @"account.diskSize and given diskSize not equals.");
}

- (void)testPKAccountSettings
{
    PKAccountSettings *accountSettings = nil;
    
    NSMutableDictionary *accountSettingsDict = [[NSMutableDictionary alloc] init];
    [accountSettingsDict setValue:[NSNumber numberWithInteger:0] forKey:@"default_download_folder"];
    [accountSettingsDict setValue:[NSNumber numberWithBool:YES] forKey:@"is_invisible"];
    [accountSettingsDict setValue:[NSNumber numberWithBool:NO] forKey:@"hide_items_shared"];
    [accountSettingsDict setValue:[NSNumber numberWithBool:YES] forKey:@"extraction_default"];
    
    accountSettings = [[PKAccountSettings alloc] init];
    STAssertNotNil(accountSettings, @"Could not create PKAccountSettings object with init method.");
    STAssertNil(accountSettings.default_download_folder, @"accountSettings.default_download_folder must be nil when initialized with init method.");
    STAssertNil(accountSettings.is_invisible, @"accountSettings.is_invisible must be nil when initialized with init method.");
    STAssertNil(accountSettings.hide_items_shared, @"accountSettings.hide_items_shared must be nil when initialized with init method.");
    STAssertNil(accountSettings.extraction_default, @"accountSettings.extraction_default must be nil when initialized with init method.");

    accountSettings = [[PKAccountSettings alloc] initWithDictionary:accountSettingsDict];
    STAssertNotNil(accountSettings, @"Could not create PKAccountSettings object with initWithDictionary method.");
    STAssertEquals(accountSettings.default_download_folder, [accountSettingsDict valueForKey:@"default_download_folder"], @"accountSettings.default_download_folder and given default_download_folder not equals.");
    STAssertTrue([accountSettings.is_invisible boolValue], @"accountSettings.is_invisible must be boolean True.");
    STAssertFalse([accountSettings.hide_items_shared boolValue], @"accountSettings.hide_items_shared must be boolean False.");
    STAssertTrue([accountSettings.extraction_default boolValue], @"accountSettings.extraction_default must be boolean True.");
}

- (void)testPKFriend
{
    PKFriend *friend = nil;
    
    NSMutableDictionary *friendDict = [[NSMutableDictionary alloc] init];
    [friendDict setValue:@"TestUser" forKey:@"name"];
    
    friend = [[PKFriend alloc] init];
    STAssertNotNil(friend, @"Could not create PKFriend object with init method.");
    STAssertNil(friend.name, @"friend.name must be nil when initialized with init method.");

    friend = [[PKFriend alloc] initWithDictionary:friendDict];
    STAssertNotNil(friend, @"Could not create PKFriend object with initWithDictionary method.");
    STAssertEquals(friend.name, [friendDict valueForKey:@"name"], @"friend.name and given name not equals.");
}

@end
