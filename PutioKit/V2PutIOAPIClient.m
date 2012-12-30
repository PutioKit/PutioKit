//
//  V2PutIOClient.m
//  Puttio
//
//  Created by orta therox on 24/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

// https://put.io/v2/docs/

#import "V2PutIOAPIClient.h"
#import "PutIONetworkConstants.h"
#import "PutioKit.h"


@implementation V2PutIOAPIClient

+ (id)setup {
    V2PutIOAPIClient *api = [[V2PutIOAPIClient alloc] initWithBaseURL:[NSURL URLWithString:PKAPIRootURL]];
                          
    if (api) {
        [api registerHTTPOperationClass:[AFJSONRequestOperation class]];
        [[NSNotificationCenter defaultCenter] addObserver:api selector:@selector(updateAPIToken) name:PKAppAuthTokenUpdatedNotification object:nil];
        [api updateAPIToken];
    }
    return api;
}

- (void)updateAPIToken {
    self.apiToken = [[NSUserDefaults standardUserDefaults] objectForKey:PKAppAuthTokenDefault];
}

// When is the app connected already
- (BOOL)ready {
    return (self.apiToken != nil);
}

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *))failure {
    [self genericGetAtPath:@"/v2/account/info" withParams:nil :^(id JSON) {
        PKAccount *account = [PKAccount objectWithDictionary:JSON[@"info"]];
        onComplete(account);

    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getFolderItems:(PKFolder *)folder :(void(^)(NSArray *filesAndFolders))onComplete failure:(void (^)(NSError *))failure {
    
    NSDictionary *params = @{
        @"parent_id": folder.id
    };

    [self genericGetAtPath:@"/v2/files/list" withParams:params :^(id JSON) {

        NSArray *itemDictionaries = JSON[@"files"];
        NSMutableArray *objects = [NSMutableArray array];
        
        for (NSDictionary *dictionary in itemDictionaries) {
            id contentType = dictionary[@"content_type"];
            if (contentType == [NSNull null] || [contentType isEqualToString:@"application/x-directory"]) {
                PKFolder *folder = [PKFolder objectWithDictionary:dictionary];
                [objects addObject:folder];

            }else{
                PKFile *file = [PKFile objectWithDictionary:dictionary];
                file.folder = folder;
                [objects addObject:file];
            }
        }

        onComplete(objects);

    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getAdditionalInfoForFile:(PKFile *)file :(void(^)())onComplete failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@", file.id];
    [self genericGetAtPath:path withParams:nil :^(id JSON) {
        [file updateObjectWithDictionary:JSON];
        onComplete();

    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getMP4InfoForFile:(PKFile *)file :(void(^)(PKMP4Status *status))onComplete failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@/mp4", file.id];
    [self genericGetAtPath:path withParams:nil :^(id JSON) {
        PKMP4Status *status = [PKMP4Status objectWithDictionary:JSON];
        onComplete(status);
        
    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)getTransfers :(void(^)(NSArray *transfers))onComplete failure:(void (^)(NSError *error))failure {
    [self genericGetAtPath:@"/v2/transfers/list" withParams:nil :^(id JSON) {

        NSArray *transfers = [JSON valueForKeyPath:@"transfers"];
        NSMutableArray *returnedTransfers = [NSMutableArray array];
        if (transfers) {
            for (NSDictionary *transferDict in transfers) {
                PKTransfer *transfer = [PKTransfer objectWithDictionary:transferDict];
                [returnedTransfers addObject:transfer];
            }
        }
        onComplete(returnedTransfers);

    } failure:^(NSError *error) {
        failure(error);
    }];
}

- (void)cancelTransfer:(PKTransfer *)transfer :(void(^)())onComplete failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"/v2/transfers/cancel?oauth_token=%@", self.apiToken];
    NSDictionary *params = @{ @"transfer_ids": transfer.id };

    [self postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        onComplete();
    }
     
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"failure in requesting delete %@", error);
       failure(error);
    }];
}

#pragma mark -
#pragma mark Requests

- (void)requestDeletionForDisplayItem:(NSObject <PKFolderItem> *)item :(void(^)(id userInfoObject))onComplete failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"/v2/files/delete?oauth_token=%@", self.apiToken];
    NSDictionary *params = @{ @"file_ids": item.id };
    
    [self postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        onComplete(json);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure in requesting delete %@", error);
        failure(error);
    }];
}

- (void)requestMP4ForFile:(PKFile *)file :(void(^)(PKMP4Status *status))onComplete failure:(void (^)(NSError *error))failure {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@/mp4?oauth_token=%@", file.id, self.apiToken];
    [self postPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        PKMP4Status *status = [PKMP4Status objectWithDictionary:json];
        onComplete(status);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"failure in requesting MP4 %@", error);
        failure(error);
    }];
}

- (void)requestTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete addFailure:(void (^)())onAddFailure networkFailure:(void (^)(NSError *error))failure {
    NSString *address = [NSString stringWithFormat:@"/v2/transfers/add?oauth_token=%@", self.apiToken];
    NSDictionary *params = @{@"url": path};

    [self postPath:address parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if ([json[@"status"] isEqualToString:@"ERROR"]) {
            onAddFailure();
        } else {
            onComplete(json);
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure in requesting torrent / magnet %@", error);
        failure(error);
    }];
}

#pragma mark internal API

- (void)genericGetAtPath:(NSString *)path withParams:(NSDictionary *)params :(void(^)(id JSON))onComplete failure:(void (^)(NSError *error))failure {
     NSMutableDictionary *requestParams = [ @{@"oauth_token": self.apiToken} mutableCopy];
     [requestParams addEntriesFromDictionary:params];

    [self getPath:path parameters:requestParams success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error= nil;
        if (!responseObject) {
            onComplete(nil);
            return;
        }

        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            NSLog(@"JSON parsing error in %@", NSStringFromSelector(_cmd));
            failure(error);
        } else {
            onComplete(json);
        }
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request failed %@ (%i)", operation.request.URL, operation.response.statusCode);
        failure(error);
    }];
}

@end
