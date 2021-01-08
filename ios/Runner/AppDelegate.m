#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
    // 1.创建命名方法通道(唯一的字符串标识符为'samples.story5/utils')
    FlutterMethodChannel *channel = [FlutterMethodChannel methodChannelWithName:@"samples.story5/utils" binaryMessenger:(FlutterViewController *)self.window.rootViewController];
    // 往方法通道注册方法调用处理回调
    [channel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
       // 2.方法名称一致(方法名:'openAppStore')
        if ([call.method isEqualToString:@"openAppStore"]) {
            // 打开App Store (本例打开微信的URL)
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"itms-apps://itunes.apple.com/xy/app/foo/id414478124"]];
            // 返回方法处理结果
            result(@0);
        } else {
            // 找不到被调用的方法
            result(FlutterMethodNotImplemented);
        }
    }];
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
