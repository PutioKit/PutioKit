//
//  PutIOClient.h
//  Puttio
//
//  Created by orta therox on 23/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PutioKit.h"
#import "AFHTTPClient.h"

@interface PutIOClient : AFHTTPClient

+ (PutIOClient *)createSharedClientWithAppSecret:(NSString *)secret;
+ (PutIOClient *)sharedClient;

- (BOOL)ready;
- (void)startup;

@property NSString *clientID;
@property NSString *clientSecret;
@property NSString *appOAuthID;

+ (NSString *)appendOauthToken:(NSString *)inputURL;

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *error))failure;
- (void)getFolderItems:(PKFolder *)folder :(void(^)(NSArray *filesAndFolders))onComplete onFailure:(void (^)(NSError *))failure;
- (void)getAdditionalInfoForFile:(PKFile *)file :(void(^)())onComplete failure:(void (^)(NSError *error))failure;
- (void)getMP4InfoForFile:(PKFile *)file :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure;

- (void)getTransfers:(void(^)(NSArray *transfers))onComplete failure:(void (^)(NSError *error))failure;

- (void)requestDeletionForDisplayItem:(NSObject <PKFolderItem> *)item :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure;

- (void)requestMP4ForFile:(PKFile *)file failure:(void (^)(NSError *error))failure;

- (void)requestTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure;

@end
