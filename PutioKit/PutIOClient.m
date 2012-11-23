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
#import "PutIONetworkConstants.h"

@interface PutIOClient ()
@property V2PutIOAPIClient *v2Client;
@property (strong) NSString *appSecret;
@end

@implementation PutIOClient

static PutIOClient *_sharedClient = nil;

+ (PutIOClient *)sharedClient {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[PutIOClient alloc] init];
        _sharedClient.v2Client = [V2PutIOAPIClient setup];
    });

    return _sharedClient;
}

+ (NSString *)appendOauthToken:(NSString *)string {
    NSString *token = [[NSUserDefaults standardUserDefaults] objectForKey:PKAppAuthTokenDefault];
    return [NSString stringWithFormat:@"%@?oauth_token=%@", string, token];
}

- (BOOL)ready {
    return [self.v2Client ready];
}

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client getAccount:^(PKAccount *account) {
        onComplete(account);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getFolderItems:(PKFolder *)folder :(void(^)(NSArray *filesAndFolders))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client getFolderItems:folder :^(NSArray *filesAndFolders) {
        onComplete(filesAndFolders);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getAdditionalInfoForFile:(PKFile *)file :(void(^)())onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client getAdditionalInfoForFile:file :^{
        onComplete(file);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getMP4InfoForFile:(PKFile *)file :(void(^)(PKMP4Status *status))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client getMP4InfoForFile:(PKFile *)file :^(PKMP4Status *status) {
        onComplete(status);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getTransfers:(void(^)(NSArray *transfers))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client getTransfers:^(NSArray *transfers) {
        onComplete(transfers);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

#warning return value -> object
- (void)requestDeletionForDisplayItem:(NSObject <PKFolderItem> *)item :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client requestDeletionForDisplayItem:item :^(id userInfoObject) {
        onComplete(userInfoObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)requestTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client requestTorrentOrMagnetURLAtPath:path :^(id userInfoObject) {
        onComplete(userInfoObject);
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)requestMP4ForFile:(PKFile *)file :(void(^)())onComplete failure:(void (^)(NSError *error))failure {
    [self.v2Client requestMP4ForFile:file :^{
        onComplete();
    } failure:^(NSError *error) {
        failure(error);
    }];
}

@end
