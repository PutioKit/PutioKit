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
    V2PutIOAPIClient *api = [[V2PutIOAPIClient alloc] initWithBaseURL:[NSURL URLWithString:@"https://api.put.io/"]];
                          
    if (api) {
        [api registerHTTPOperationClass:[AFJSONRequestOperation class]];
        api.apiToken = [[NSUserDefaults standardUserDefaults] objectForKey:PKAppAuthTokenDefault];
    }
    return api;
}


// When is the app connected already
- (BOOL)ready {
    return (self.apiToken != nil);
}

- (void)getAccessTokenFromOauthCode:(NSString *)code {
    // https://api.put.io/v2/oauth2/access_token?client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&grant_type=authorization_code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI&code=CODE
    
    NSString *address = [NSString stringWithFormat:PTFormatOauthTokenURL, self.appOAuthID, self.clientSecret, @"authorization_code", PKCallbackOriginal, code];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {
        
        NSString *appAuthToken = [JSON valueForKeyPath:@"access_token"];
        [[NSUserDefaults standardUserDefaults] setObject:appAuthToken forKey:PKAppAuthTokenDefault];
        [[NSUserDefaults standardUserDefaults] synchronize];
        self.apiToken = appAuthToken;

    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"error %@", error);
    }];
    [operation start];
}

- (void)getAccount:(void(^)(PKAccount *account))onComplete failure:(void (^)(NSError *))failure {
    NSDictionary *params = @{ @"oauth_token": self.apiToken };
    [self getPath:@"/v2/account/info" parameters:params success: ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError *error = nil;
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            NSLog(@"%@", NSStringFromSelector(_cmd));
            NSLog(@"json parsing error. %@", error.localizedFailureReason);
        }

        if ([[jsonDictionary valueForKeyPath:@"status"] isEqualToString:@"OK"]) {
            return [PKAccount objectWithDictionary:jsonDictionary];

        }else{
            NSLog(@"request %@", operation.request.URL);
            NSLog(@"request not OK, JSON response is - %@", jsonDictionary);
        }

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
}

- (void)getFolder:(PKFolder *)folder :(void(^)(NSArray *filesAndFolders))onComplete failure:(void (^)(NSError *))failure {
    NSDictionary *params = @{
        @"oauth_token": self.apiToken,
        @"parent_id": folder.id
    };
    
    [self getPath:@"/v2/files/list" parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"got folder");
        NSError *error = nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            NSLog(@"%@", NSStringFromSelector(_cmd));
            NSLog(@"json parsing error.");
        }
        if ([[json valueForKeyPath:@"status"] isEqualToString:@"OK"]) {
            onComplete([self filesAndFoldersFromJSONArray:[json valueForKeyPath:@"files"] withParent:folder]);
        }else{
            NSLog(@"request %@", operation.request.URL);
            NSLog(@"request not OK, JSON response is - %@", jsonDictionary);
        }
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        onComplete(error);        
    }];
}

- (NSArray *)filesAndFoldersFromJSONArray:(NSArray *)dictionaries withParent:(PKFolder *)parent{
    NSMutableArray *objects = [NSMutableArray array];
    for (NSDictionary *dictionary in dictionaries) {
        
        id contentType = dictionary[@"content_type"];
        if ( contentType == [NSNull null] || [contentType isEqualToString:@"application/x-directory"]) {
            PKFolder *folder = [PKFolder objectWithDictionary:dictionary];
            folder.parentFolder = parent;
            [objects addObject:folder];
            
        }else{
            File *file = [[File alloc] init];
            file.id = [dictionary[@"id"] stringValue];
            file.name = dictionary[@"name"];
            file.displayName = [File createDisplayNameFromName:file.name];
            file.screenShotURL =  [dictionary onlyStringForKey:@"screenshot"];
            if (!file.screenShotURL) {
                file.screenShotURL =  [dictionary onlyStringForKey:@"icon"];
            }

            if (dictionary[@"is_mp4_available"] != [NSNull null]) {
                file.hasMP4 = dictionary[@"is_mp4_available"];
            }
            
            file.contentType =  dictionary[@"content_type"];
            file.parentID = [dictionary[@"parent_id"] stringValue];
            file.size = dictionary[@"size"];
            file.folder = parent;
            
            [objects addObject:file];
        }
    }
    return objects;
}

- (void)getInfoForFile:(File*)file :(void(^)(id userInfoObject))onComplete {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@", file.id];
    [self genericGetAtPath:path :^(id userInfoObject) {
        onComplete(userInfoObject);
    }];
}

- (void)getMP4InfoForFile:(File*)file :(void(^)(id userInfoObject))onComplete {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@/mp4", file.id];
    [self genericGetAtPath:path :^(id userInfoObject) {
        NSLog(@" MP4 -- %@", userInfoObject);
        onComplete(userInfoObject);
    }];
}

- (void)getTransfers :(void(^)(id userInfoObject))onComplete {
    [self genericGetAtPath:@"/v2/transfers/list" :^(id userInfoObject) {
        if (![userInfoObject isKindOfClass:[NSError class]]) {
            NSArray *transfers = [userInfoObject valueForKeyPath:@"transfers"];
            NSMutableArray *returnedTransfers = [NSMutableArray array];
            if (transfers) {
                for (NSDictionary *transferDict in transfers) {
                    Transfer *transfer = [[Transfer alloc] init];
                    transfer.name = transferDict[@"name"];
                    transfer.downloadSpeed =  transferDict[@"down_speed"];
                    transfer.percentDone =  transferDict[@"percent_done"];
                    transfer.estimatedTime = transferDict[@"estimated_time"];
                    transfer.createdAt = transferDict[@"created_at"];
                    transfer.displayName = [File createDisplayNameFromName:transfer.name];
                    if (transferDict[@"error_message"] != [NSNull null]) {
                        transfer.status = TransferStatusERROR;
                    }else {
                        transfer.status = TransferStatusOK;
                    }
                    [returnedTransfers addObject:transfer];
                }
            }
            onComplete(returnedTransfers);
            return;
        }
        onComplete(userInfoObject);
    }];
}

- (void)requestDeletionForDisplayItemID:(NSString *)itemID :(void(^)(id userInfoObject))onComplete {
    
    NSString *path = [NSString stringWithFormat:@"/v2/files/delete?oauth_token=%@", self.apiToken];
    NSDictionary *params = @{@"file_ids": itemID};
    [self postPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        onComplete(json);
    }
   failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"failure in requesting delete %@", error);
       onComplete(error);
   }];
}

- (void)requestMP4ForFile:(File*)file {
    NSString *path = [NSString stringWithFormat:@"/v2/files/%@/mp4?oauth_token=%@", file.id, self.apiToken];
    [self postPath:path parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"requested MP4 for %@", file.name);
        
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
       NSLog(@"failure in requesting MP4 %@", error);
    }];
}

- (void)downloadTorrentOrMagnetURLAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete {
    NSString *address = [NSString stringWithFormat:@"/v2/transfers/add?oauth_token=%@", self.apiToken];
    NSDictionary *params = @{@"url": path};

    [self postPath:address parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        NSLog(@"downloadTorrentOrMagnetURLAtPath completed %@", json);
        onComplete(json);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"failure in requesting torrent / magnet %@", error);
        onComplete(error);
    }];
}

#pragma mark internal API gubbins

- (void)genericGetAtPath:(NSString *)path :(void(^)(id userInfoObject))onComplete {
    NSDictionary *params = @{@"oauth_token": self.apiToken};
    [self getPath:path parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {

        NSError *error= nil;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error];
        if (error) {
            NSLog(@"%@", NSStringFromSelector(_cmd));
            NSLog(@"json parsing error.");
        }
        onComplete(json);
    }
    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"request %@", operation.request.URL);

        NSLog(@"failure!");
      onComplete(error);        
    }];
}

@end
