#import "AppDelegate.h"
#import "GeneratedPluginRegistrant.h"
#import "SampleViewFactory.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    // Override point for customization after application launch.
    
    NSObject<FlutterPluginRegistrar> *registrar = [self registrarForPlugin:@"com.story5/native_views"];
    
    // 把原生视图的创建与 Flutter 侧的调用关联起来，才可以在 Flutter 侧找到原生视图的实现：
    SampleViewFactory* viewFactory = [[SampleViewFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:viewFactory withId:@"SampleView"];
    
    return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
