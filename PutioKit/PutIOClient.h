//
//  PutIOClient.h
//  Puttio
//
//  Created by orta therox on 23/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "AFHTTPClient.h"
#import "PKFolderItem.h"

// This is where the bulk of the API is presented to app developers.
// This class forwards most of it's methods to it's v2API which
//  does the majority of the real work.

@class  PKFile, PKAccount, PKFolder, PKTransfer, PKMP4Status;

@interface PutIOClient : AFHTTPClient

+ (PutIOClient *)sharedClient;
+ (NSString *)appendOauthToken:(NSString *)string;

- (BOOL)ready;

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *error))failure;

- (void)getFolderItems:(PKFolder *)folder :(void(^)(NSArray *filesAndFolders))onComplete failure:(void (^)(NSError *error))failure;

- (void)getAdditionalInfoForFile:(PKFile *)file :(void(^)())onComplete failure:(void (^)(NSError *error))failure;

- (void)getMP4InfoForFile:(PKFile *)file :(void(^)(PKMP4Status *status))onComplete failure:(void (^)(NSError *error))failure;

- (void)getTransfers:(void(^)(NSArray *transfers))onComplete failure:(void (^)(NSError *error))failure;
- (void)cancelTransfer:(PKTransfer *)transfer :(void(^)())onComplete failure:(void (^)(NSError *error))failure;

- (void)requestDeletionForDisplayItem:(NSObject <PKFolderItem> *)item :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure;

- (void)requestMP4ForFile:(PKFile *)file :(void(^)(PKMP4Status *status))onComplete failure:(void (^)(NSError *error))failure;

- (void)requestTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete addFailure:(void (^)())onAddFailure networkFailure:(void (^)(NSError *error))failure;

@end
