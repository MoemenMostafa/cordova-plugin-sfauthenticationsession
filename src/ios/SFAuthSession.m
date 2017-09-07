#import "SFAuthSession.h"

#import <SafariServices/SFAuthenticationSession.h>

#import <Cordova/CDVAvailability.h>

BOOL openedSafari = NO;
SFAuthenticationSession *_authenticationVC;


@implementation SFAuthSession;

- (void)pluginInitialize {
    if (@available(iOS 11.0, *)) {

    }
}

- (void)start:(CDVInvokedUrlCommand *)command {

    if (@available(iOS 11.0, *)) {
        NSString* redirectScheme = [command.arguments objectAtIndex:0];
        NSURL* requestURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
        SFAuthenticationSession* authenticationVC =
        [[SFAuthenticationSession alloc] initWithURL:requestURL
                                   callbackURLScheme:redirectScheme
                                   completionHandler:^(NSURL * _Nullable callbackURL,
                                                       NSError * _Nullable error) {
                                       _authenticationVC = nil;
                                       CDVPluginResult *result;
                                       if (callbackURL) {
                                           NSLog(@"success");
                                           NSLog(@"%@", callbackURL);
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: callbackURL.absoluteString];

                                       } else {
                                           NSLog(@"error");
                                           NSLog(@"%@", error);
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
                                       }
                                       [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                                   }];
        _authenticationVC = authenticationVC;
        [authenticationVC start];
    }
}

@end
