//
//  NetworkConstants.m
//  Puttio
//
//  Created by orta therox on 25/03/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

NSString *const PKCallbackOriginal = @"puttio://callback";
NSString *const PKCallbackModified = @"puttio://callback/%3Fcode";

NSString *const PKRootURL = @"https://put.io/";
NSString *const PKSettingsURL = @"https://put.io/user/settings";
NSString *const PTLoginURL = @"https://put.io/?login=1";

NSString *const PTFormatOauthTokenURL = @"https://api.put.io/v2/oauth2/access_token?client_id=%@&client_secret=%@&grant_type=%@&redirect_uri=%@&code=%@";
NSString *const PKFormatOauthLoginURL = @"https://api.put.io/v2/oauth2/authenticate?client_id=%@&response_type=code&redirect_uri=%@";
NSString *const PKFormatOauthURL = @"https://api.put.io/v2/oauth2/authenticate?client_id=%@&response_type=code&redirect_uri=%@";

NSString *const PKAppOAuthCallback = @"puttio://callback";

NSString *const PKAppAuthTokenDefault = @"AppAuthToken";
NSString *const PKAPIKeyDefault = @"APIKeyDefault";
NSString *const PKAPISecretDefault = @"APISecretDefault";

NSString *const PKAppAuthTokenUpdatedNotification = @"PKAppAuthTokenUpdatedNotification";