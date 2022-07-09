#import "AdTurboPlugin.h"
#if __has_include(<ad_turbo/ad_turbo-Swift.h>)
#import <ad_turbo/ad_turbo-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "ad_turbo-Swift.h"
#endif

@implementation AdTurboPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAdTurboPlugin registerWithRegistrar:registrar];
}
@end
