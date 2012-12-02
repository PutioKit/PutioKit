//
//  OAuthController.h
//  Puttio
//
//  Created by orta therox on 13/05/2012.
//  Copyright (c) 2012 ortatherox.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PutIOOAuthHelper;
@protocol PutIOOAuthHelperDelegate <NSObject>
- (void)authHelperDidLogin:(PutIOOAuthHelper *)helper;
- (void)authHelperLoginFailedWithDescription:(NSString *)errorDescription;
- (void)authHelperHasDeclaredItScrewed;
@end

@interface PutIOOAuthHelper : NSObject <UIWebViewDelegate>
@property (weak) IBOutlet UIWebView *webView;
@property (weak) IBOutlet NSObject <PutIOOAuthHelperDelegate> *delegate;

@property (strong) NSString *clientID;
@property (strong) NSString *clientSecret;

- (void)loginWithUsername:(NSString *)username andPassword:(NSString *)password;
- (void)loadAuthPage;
@end
