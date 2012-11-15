//
//  PutioKitTests.m
//  PutioKitTests
//
//  Copyright (c) 2012 Ahmet AYGÜN
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

- (void)testPKFile
{
    PKFile *file = nil;
    
    NSMutableDictionary *fileDict = [[NSMutableDictionary alloc] init];
    [fileDict setValue:[NSNumber numberWithBool:NO] forKey:@"is_shared"];
    [fileDict setValue:@"A_video.avi" forKey:@"name"];
    [fileDict setValue:@"http://put.io/screenshots/aFZlk2VjXlySh1ZiWWZlZZZfXWVbW2SKZWKTlWCIlFaHloltkJFgXw.jpg" forKey:@"screenshot"];
    [fileDict setValue:@"2012-03-28T09:14:17" forKey:@"created_at"];
    [fileDict setValue:[NSNumber numberWithInt:0] forKey:@"parent_id"];
    [fileDict setValue:[NSNumber numberWithBool:NO] forKey:@"is_mp4_available"];
    [fileDict setValue:@"video/x-msvideo" forKey:@"content_type"];
    [fileDict setValue:@"http://put.io/thumbnails/aFZlk2VjXlySh1ZiWWZlZZZfXWVbW2SKZWKTlWCIlFaHloltkJFgXw.jpg" forKey:@"icon"];
    [fileDict setValue:[NSNumber numberWithInt:12345] forKey:@"id"];
    [fileDict setValue:[NSNumber numberWithLongLong:3204132] forKey:@"size"];

    file = [[PKFile alloc] init];
    STAssertNotNil(file, @"Could not create PKFile object with init method.");
    STAssertNil(file.isShared, @"transfer.is_shared must be nil when initialized with init method.");
    STAssertNil(file.name, @"transfer.name must be nil when initialized with init method.");
    STAssertNil(file.screenshot, @"transfer.screenshot must be nil when initialized with init method.");
    STAssertNil(file.createdAt, @"transfer.created_at must be nil when initialized with init method.");
    STAssertNil(file.parentID, @"transfer.parent_id must be nil when initialized with init method.");
    STAssertNil(file.isMP4Available, @"transfer.is_mp4_available must be nil when initialized with init method.");
    STAssertNil(file.content_type, @"transfer.content_type must be nil when initialized with init method.");
    STAssertNil(file.icon, @"transfer.icon must be nil when initialized with init method.");
    STAssertNil(file.fid, @"transfer.fid must be nil when initialized with init method.");
    STAssertNil(file.size, @"transfer.size must be nil when initialized with init method.");

    file = [[PKFile alloc] initWithDictionary:fileDict];
    STAssertNotNil(file, @"Could not create PKFile object with initWithDictionary method.");
    STAssertEquals([file.isShared boolValue], [[fileDict valueForKey:@"is_shared"] boolValue], @"file.is_shared and given is_shared not equals.");
    STAssertEquals(file.name, [fileDict valueForKey:@"name"], @"file.name and given name not equals.");
    STAssertEquals(file.screenshot, [fileDict valueForKey:@"screenshot"], @"file.screenshot and given screenshot not equals.");
    STAssertEquals(file.createdAt, [fileDict valueForKey:@"created_at"], @"file.created_at and given created_at not equals.");
    STAssertEquals([file.parentID intValue], [[fileDict valueForKey:@"parent_id"] intValue], @"file.parent_id and given parent_id not equals.");
    STAssertEquals([file.isMP4Available boolValue], [[fileDict valueForKey:@"is_mp4_available"] boolValue], @"file.is_mp4_available and given is_mp4_available not equals.");
    STAssertEquals(file.content_type, [fileDict valueForKey:@"content_type"], @"file.content_type and given content_type not equals.");
    STAssertEquals(file.icon, [fileDict valueForKey:@"icon"], @"file.icon and given icon not equals.");
    STAssertEquals([file.fid intValue], [[fileDict valueForKey:@"id"] intValue], @"file.fid and given id not equals.");
    STAssertEquals([file.size longLongValue], [[fileDict valueForKey:@"size"] longLongValue], @"file.size and given size not equals.");
}
- (void)testPKTransfer
{
    PKTransfer *transfer = nil;

    NSMutableDictionary *transferDict = [[NSMutableDictionary alloc] init];
    [transferDict setValue:[NSNumber numberWithInt:10] forKey:@"uploaded"];
    [transferDict setValue:[NSNumber numberWithInt:5] forKey:@"estimated_time"];
    [transferDict setValue:[NSNumber numberWithInt:2] forKey:@"peers_getting_from_us"];
    [transferDict setValue:[NSNumber numberWithBool:NO] forKey:@"extract"];
    [transferDict setValue:[NSNumber numberWithFloat:12.3] forKey:@"current_ratio"];
    [transferDict setValue:[NSNumber numberWithLongLong:9409268] forKey:@"size"];
    [transferDict setValue:[NSNumber numberWithInt:8] forKey:@"up_speed"];
    [transferDict setValue:[NSNumber numberWithBool:YES] forKey:@"is_seeding"];
    [transferDict setValue:[NSNumber numberWithInt:12345] forKey:@"id"];
    [transferDict setValue:@"magnet:?xt=urn:btih:194a4c341487fd12d36718054c1e8fef4358b2ab3" forKey:@"source"];
    [transferDict setValue:[NSNumber numberWithInt:54321] forKey:@"subscription_id"];
    [transferDict setValue:@"\u2193 1.2 MB/s, \u2191 0.0 bytes/s |  dl: 2.9 MB / 9.0 MB, ul: 0.0 bytes" forKey:@"status_message"];
    [transferDict setValue:@"DOWNLOADING" forKey:@"status"];
    [transferDict setValue:[NSNumber numberWithInt:120] forKey:@"down_speed"];
    [transferDict setValue:[NSNumber numberWithInt:32] forKey:@"peers_connected"];
    [transferDict setValue:[NSNumber numberWithLongLong:3204132] forKey:@"downloaded"];
    [transferDict setValue:[NSNumber numberWithInt:2345] forKey:@"file_id"];
    [transferDict setValue:[NSNumber numberWithInt:30] forKey:@"peers_sending_to_us"];
    [transferDict setValue:[NSNumber numberWithInt:20] forKey:@"percent_done"];
    [transferDict setValue:@"" forKey:@"tracker_message"];
    [transferDict setValue:@"A video" forKey:@"name"];
    [transferDict setValue:@"2012-03-28T09:14:17" forKey:@"created_at"];
    [transferDict setValue:@"Error" forKey:@"error_message"];
    [transferDict setValue:[NSNumber numberWithInt:0] forKey:@"save_parent_id"];

    transfer = [[PKTransfer alloc] init];
    STAssertNotNil(transfer, @"Could not create PKTransfer object with init method.");
    STAssertNil(transfer.uploaded, @"transfer.uploaded must be nil when initialized with init method.");
    STAssertNil(transfer.estimated_time, @"transfer.estimated_time must be nil when initialized with init method.");
    STAssertNil(transfer.peers_getting_from_us, @"transfer.peers_getting_from_us must be nil when initialized with init method.");
    STAssertNil(transfer.extract, @"transfer.extract must be nil when initialized with init method.");
    STAssertNil(transfer.current_ratio, @"transfer.current_ratio must be nil when initialized with init method.");
    STAssertNil(transfer.size, @"transfer.size must be nil when initialized with init method.");
    STAssertNil(transfer.up_speed, @"transfer.up_speed must be nil when initialized with init method.");
    STAssertNil(transfer.is_seeding, @"transfer.is_seeding must be nil when initialized with init method.");
    STAssertNil(transfer.tid, @"transfer.tid must be nil when initialized with init method.");
    STAssertNil(transfer.source, @"transfer.source must be nil when initialized with init method.");
    STAssertNil(transfer.subscription_id, @"transfer.subscription_id must be nil when initialized with init method.");
    STAssertNil(transfer.status_message, @"transfer.status_message must be nil when initialized with init method.");
    STAssertNil(transfer.status, @"transfer.status must be nil when initialized with init method.");
    STAssertNil(transfer.down_speed, @"transfer.down_speed must be nil when initialized with init method.");
    STAssertNil(transfer.peers_connected, @"transfer.peers_connected must be nil when initialized with init method.");
    STAssertNil(transfer.downloaded, @"transfer.downloaded must be nil when initialized with init method.");
    STAssertNil(transfer.file_id, @"transfer.file_id must be nil when initialized with init method.");
    STAssertNil(transfer.peers_sending_to_us, @"transfer.peers_sending_to_us must be nil when initialized with init method.");
    STAssertNil(transfer.percent_done, @"transfer.percent_done must be nil when initialized with init method.");
    STAssertNil(transfer.tracker_message, @"transfer.tracker_message must be nil when initialized with init method.");
    STAssertNil(transfer.name, @"transfer.name must be nil when initialized with init method.");
    STAssertNil(transfer.created_at, @"transfer.created_at must be nil when initialized with init method.");
    STAssertNil(transfer.error_message, @"transfer.error_message must be nil when initialized with init method.");
    STAssertNil(transfer.save_parent_id, @"transfer.save_parent_id must be nil when initialized with init method.");

    transfer = [[PKTransfer alloc] initWithDictionary:transferDict];
    STAssertNotNil(transfer, @"Could not create PKTransfer object with initWithDictionary method.");
    STAssertEquals([transfer.uploaded intValue], [[transferDict valueForKey:@"uploaded"] intValue], @"transfer.uploaded and given uploaded not equals.");
    STAssertEquals([transfer.estimated_time intValue], [[transferDict valueForKey:@"estimated_time"] intValue], @"transfer.estimated_time and given estimated_time not equals.");
    STAssertEquals([transfer.peers_getting_from_us intValue], [[transferDict valueForKey:@"peers_getting_from_us"] intValue], @"transfer.uploaded and given uploaded not equals.");
    STAssertEquals([transfer.extract boolValue], [[transferDict valueForKey:@"extract"] boolValue], @"transfer.extract and given extract not equals.");
    STAssertEquals([transfer.current_ratio floatValue], [[transferDict valueForKey:@"current_ratio"] floatValue], @"transfer.current_ratio and given current_ratio not equals.");
    STAssertEquals([transfer.size longLongValue], [[transferDict valueForKey:@"size"] longLongValue], @"transfer.size and given size not equals.");
    STAssertEquals([transfer.up_speed intValue], [[transferDict valueForKey:@"up_speed"] intValue], @"transfer.up_speed and given up_speed not equals.");
    STAssertEquals([transfer.is_seeding boolValue], [[transferDict valueForKey:@"is_seeding"] boolValue], @"transfer.is_seeding and given is_seeding not equals.");
    STAssertEquals([transfer.tid intValue], [[transferDict valueForKey:@"id"] intValue], @"transfer.tid and given id not equals.");
    STAssertEquals(transfer.source, [transferDict valueForKey:@"source"], @"transfer.source and given source not equals.");
    STAssertEquals([transfer.subscription_id intValue], [[transferDict valueForKey:@"subscription_id"] intValue], @"transfer.subscription_id and given subscription_id not equals.");
    STAssertEquals(transfer.status_message, [transferDict valueForKey:@"status_message"], @"transfer.status_message and given status_message not equals.");
    STAssertEquals(transfer.status, [transferDict valueForKey:@"status"], @"transfer.status and given status not equals.");
    STAssertEquals([transfer.down_speed intValue], [[transferDict valueForKey:@"down_speed"] intValue], @"transfer.down_speed and given down_speed not equals.");
    STAssertEquals([transfer.peers_connected intValue], [[transferDict valueForKey:@"peers_connected"] intValue], @"transfer.peers_connected and given peers_connected not equals.");
    STAssertEquals([transfer.downloaded longLongValue], [[transferDict valueForKey:@"downloaded"] longLongValue], @"transfer.downloaded and given downloaded not equals.");
    STAssertEquals([transfer.file_id intValue], [[transferDict valueForKey:@"file_id"] intValue], @"transfer.file_id and given file_id not equals.");
    STAssertEquals([transfer.peers_sending_to_us intValue], [[transferDict valueForKey:@"peers_sending_to_us"] intValue], @"transfer.peers_sending_to_us and given peers_sending_to_us not equals.");
    STAssertEquals([transfer.percent_done intValue], [[transferDict valueForKey:@"percent_done"] intValue], @"transfer.percent_done and given percent_done not equals.");
    STAssertEquals(transfer.tracker_message, [transferDict valueForKey:@"tracker_message"], @"transfer.tracker_message and given tracker_message not equals.");
    STAssertEquals(transfer.name, [transferDict valueForKey:@"name"], @"transfer.name and given name not equals.");
    STAssertEquals(transfer.created_at, [transferDict valueForKey:@"created_at"], @"transfer.created_at and given created_at not equals.");
    STAssertEquals(transfer.error_message, [transferDict valueForKey:@"error_message"], @"transfer.error_message and given error_message not equals.");
    STAssertEquals([transfer.save_parent_id intValue], [[transferDict valueForKey:@"save_parent_id"] intValue], @"transfer.save_parent_id and given save_parent_id not equals.");
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
