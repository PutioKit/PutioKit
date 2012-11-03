//
//  PutIOClient.h
//  Puttio
//
//  Created by orta therox on 23/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "AFHTTPClient.h"

@class PKAccount, PKFile;

@interface PutIOClient : AFHTTPClient

+ (PutIOClient *)createSharedClientWithAppSecret:(NSString *)secret;
+ (PutIOClient *)sharedClient;

- (BOOL)ready;
- (void)startup;


+ (NSString *)appendOauthToken:(NSString *)inputURL;

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *error))onFailure;

//- (void)getFolder:(PKFolder *)folder :(void(^)(id userInfoObject))onComplete;
//
//- (void)getMP4InfoForFile:(PKFile *)file :(void(^)(id userInfoObject))onComplete;
//- (void)requestMP4ForFile:(PKFile *)file;
//
//- (void)getTransfers:(void(^)(NSArray *transfers))onComplete;
//
//- (void)downloadTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(PKTransfer *transfer))onComplete;
//- (void)requestDeletionForDisplayItemID:(NSString *)itemID :(void(^)(id userInfoObject))onComplete;
@end
