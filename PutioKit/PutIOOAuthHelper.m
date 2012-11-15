//
//  OAuthController.m
//  Puttio
//
//  Created by orta therox on 13/05/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import "PutIOClient.h"
#import "PutIOOAuthHelper.h"
#import "AFNetworking.h"
#import "PutIONetworkConstants.h"

// https://put.io/v2/docs/#authentication

// The order of this is

// Redirect to the OAuth dialog
// Put in the creds ourselves
// Get redirected to the "accept the application page" tap via js
// Then call delegate method.

@interface PutIOOAuthHelper (){
    NSString *_username;
    NSString *_password;
    BOOL _attemptedLogin;
}

@end

@implementation PutIOOAuthHelper

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password {
    _webView.delegate = self;
    _attemptedLogin = NO;
    
    [self loadAuthPage];
    _username = username;
    _password = password;
}

- (void)loadAuthPage {
    
    NSString *address = [NSString stringWithFormat:PKFormatOauthLoginURL, [PutIOClient sharedClient].appOAuthID, PKAppOAuthCallback];
    NSURL * url = [NSURL URLWithString:address];
    [_webView loadRequest:[NSURLRequest requestWithURL:url]];
}

#pragma mark -
#pragma mark Webview delegate methods

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {    
    // after you log in, it redrects to root, we actually want it 
    if ([[request.URL absoluteString] isEqualToString:PKRootURL] ||
        [[request.URL absoluteString] hasPrefix: @"https://put.io/search"]) {
        [self loadAuthPage];
        return NO;
    }
    return YES;
}

- (void)getAccessTokenFromOauthCode:(NSString *)code {
    // https://api.put.io/v2/oauth2/access_token?client_id=YOUR_CLIENT_ID&client_secret=YOUR_CLIENT_SECRET&grant_type=authorization_code&redirect_uri=YOUR_REGISTERED_REDIRECT_URI&code=CODE

    NSString *address = [NSString stringWithFormat:PTFormatOauthTokenURL, [PutIOClient sharedClient].clientID, [PutIOClient sharedClient].clientSecret, @"authorization_code", PKCallbackOriginal, code];

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
    AFJSONRequestOperation *operation = [AFJSONRequestOperation JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id JSON) {

        NSString *appAuthToken = [JSON valueForKeyPath:@"access_token"];
        [[NSUserDefaults standardUserDefaults] setObject:appAuthToken forKey:PKAppAuthTokenDefault];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [[NSNotificationCenter defaultCenter] postNotificationName:PKAppAuthTokenUpdatedNotification object:nil];

    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id JSON) {
        NSLog(@"error %@", error);
    }];
    [operation start];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    if (error.code == 101) {
        NSString *code = [error userInfo][@"NSErrorFailingURLStringKey"];
        NSArray *URLComponents = [code componentsSeparatedByString:@"%3D"];
        
        if (URLComponents.count > 1 && [code hasPrefix: PKCallbackModified]) {
            [self getAccessTokenFromOauthCode:URLComponents[1]];
        }
    }else{
        if (error.code == 102 || error.code == -999) {
            // no-op as the puttio:// url causes both errors 101/102
        }else if (error.code == -1009) {
            [self.delegate authHelperLoginFailedWithDescription:@"You are curretly offline."];
        }else {
            // actually unexpected
            [self.delegate authHelperHasDeclaredItScrewed];
        }
    }
}

- (void)webViewDidFinishLoad:(UIWebView *)aWebView {
    NSString *address = aWebView.request.URL.absoluteString;
    
    if([address hasPrefix:@"https://put.io/v2/oauth2/login"] && !_attemptedLogin){
        _attemptedLogin = YES;
        NSString *setUsername = [NSString stringWithFormat:@"document.getElementsByTagName('input')[0].value = '%@'", _username];
        [_webView stringByEvaluatingJavaScriptFromString:setUsername];
        
        NSString *setPassword = [NSString stringWithFormat:@"document.getElementsByTagName('input')[1].value = '%@'", _password];
        [_webView stringByEvaluatingJavaScriptFromString:setPassword];

        [_webView stringByEvaluatingJavaScriptFromString:@"document.getElementsByTagName('form')[0].submit()"];

    } else if ([address rangeOfString:@"oauth2/authenticate"].location != NSNotFound) {
        // The Allow / Deny form
        
        NSString *submitForm = @"document.getElementsByTagName('input')[1].click()";
        [_webView stringByEvaluatingJavaScriptFromString:submitForm];

    } else {

        [self.delegate authHelperLoginFailedWithDescription:@"Wrong Username / Password combo"];
    }
}

@end