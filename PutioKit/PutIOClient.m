//
//  PutIOClient.m
//  Puttio
//
//  Created by orta therox on 23/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PutIOClient.h"
#import "AFJSONRequestOperation.h"
#import "V2PutIOAPIClient.h"

@interface PutIOClient ()
@property V2PutIOAPIClient *v2Client;
@property (strong) NSString *appSecret;
@end

@implementation PutIOClient

+ (PutIOClient *)createSharedClientWithAppSecret:(NSString *)secret {
    static PutIOClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[PutIOClient alloc] init];
        _sharedClient.v2Client = [V2PutIOAPIClient setup];
    });

    return _sharedClient;
}

- (BOOL)ready {
    return [self.v2Client ready];
}

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *))onFailure {
    [self.v2Client getAccount:^(PKAccount *account) {
        onComplete(account);
    } failure:^(NSError *error) {
        onFailure(error);
    }];
}
//
//- (void)getFolder:(Folder *)folder :(void(^)(id userInfoObject))onComplete {
//    [self.v2Client getFolder:folder :^(id userInfoObject)  {
//        onComplete(userInfoObject);  
//    }];
//}
//
//- (void)requestDeletionForDisplayItemID:(NSString *)itemID :(void(^)(id userInfoObject))onComplete {
//    [self.v2Client requestDeletionForDisplayItemID:itemID :^(id userInfoObject)  {
//        onComplete(userInfoObject);  
//    }];
//}
//
//- (void)getMP4InfoForFile:(File *)file :(void(^)(id userInfoObject))onComplete {
//    [self.v2Client getMP4InfoForFile:file :^(id userInfoObject)  {
//        onComplete(userInfoObject);  
//    }];
//}
//
//- (void)getTransfers:(void(^)(id userInfoObject))onComplete {
//    [self.v2Client getTransfers :^(id userInfoObject) {
//        onComplete(userInfoObject);  
//    }];
//}
//
//- (void)requestMP4ForFile:(File*)file {
//    [self.v2Client requestMP4ForFile:file];
//}
//
//- (void)downloadTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete {
//    [self.v2Client downloadTorrentOrMagnetURLAtPath:path :^(id userInfoObject) {
//        onComplete(userInfoObject);
//    }];
//}

@end
