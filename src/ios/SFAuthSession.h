#import <Cordova/CDVPlugin.h>

@interface SFAuthSession : CDVPlugin {
}

// The hooks for our plugin commands
- (void)start:(CDVInvokedUrlCommand *)command;

@end
