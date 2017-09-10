#import <Availability.h>
#import "SFAuthSession.h"

#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 110000

#import <SafariServices/SFAuthenticationSession.h>

#import <Cordova/CDVAvailability.h>

SFAuthenticationSession *_authenticationVC;


@implementation SFAuthSession;

- (void)pluginInitialize {
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
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: callbackURL.absoluteString];

                                       } else {
                                           result = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"error"];
                                       }
                                       [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
                                   }];
        _authenticationVC = authenticationVC;
        [authenticationVC start];
    }
}

@end
#endif