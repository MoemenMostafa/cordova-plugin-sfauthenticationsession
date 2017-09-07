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

- (void)echo:(CDVInvokedUrlCommand *)command {
//  NSString* phrase = [command.arguments objectAtIndex:0];


    if (@available(iOS 11.0, *)) {
        NSString* redirectScheme = [command.arguments objectAtIndex:0];
        NSURL* requestURL = [NSURL URLWithString:[command.arguments objectAtIndex:1]];
        SFAuthenticationSession* authenticationVC =
        [[SFAuthenticationSession alloc] initWithURL:requestURL
                                   callbackURLScheme:redirectScheme
                                   completionHandler:^(NSURL * _Nullable callbackURL,
                                                       NSError * _Nullable error) {
                                       _authenticationVC = nil;
                                       if (callbackURL) {
                                           NSLog(@"success");
                                           NSLog(@"%@", callbackURL);
                                       } else {
                                           NSLog(@"error");
                                           NSLog(@"%@", error);
                                       }
                                   }];
        _authenticationVC = authenticationVC;
        [authenticationVC start];
    }
}

- (void)getDate:(CDVInvokedUrlCommand *)command {
  NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
  NSLocale *enUSPOSIXLocale = [NSLocale localeWithLocaleIdentifier:@"en_US_POSIX"];
  [dateFormatter setLocale:enUSPOSIXLocale];
  [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];

  NSDate *now = [NSDate date];
  NSString *iso8601String = [dateFormatter stringFromDate:now];

  CDVPluginResult *result = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:iso8601String];
  [self.commandDelegate sendPluginResult:result callbackId:command.callbackId];
}

@end