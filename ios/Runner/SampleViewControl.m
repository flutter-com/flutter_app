//
//  SampleViewControl.m
//  Runner
//
//  Created by story5 on 2021/1/8.
//

#import "SampleViewControl.h"

@implementation SampleViewControl{
    UIView * _templcateView;
    FlutterMethodChannel* _channel;
    NSString *_bgColor;
}

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id)args binaryMessenger:(NSObject<FlutterBinaryMessenger> *)messenger{
    if ([super init]) {
        _templcateView = [[UIView alloc] init];
        _templcateView.backgroundColor = [UIColor redColor];
        _bgColor = @"red";
        
        NSString *channelName = [NSString stringWithFormat:@"samples.story5/native_views_%lld", viewId];
        _channel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:messenger];

        __weak __typeof__(self) weakSelf = self;
        [_channel setMethodCallHandler:^(FlutterMethodCall* call, FlutterResult result) {
            [weakSelf onMethodCall:call result:result];
        }];
    }

    return self;
}

- (void)onMethodCall:(FlutterMethodCall*)call result:(FlutterResult)result {
    if ([[call method] isEqualToString:@"changeBackgroundColor"]) {
        NSLog(@"bgColor:%@",_bgColor);
        if ([_bgColor isEqualToString:@"red"]) {
            _templcateView.backgroundColor = [UIColor blueColor];
            _bgColor = @"blue";
            result(@0);
        } else {
            _templcateView.backgroundColor = [UIColor redColor];
            _bgColor = @"red";
            result(@1);
        }
        
    } else {
        result(FlutterMethodNotImplemented);
    }
}

- (UIView *)view{
    return _templcateView;
}

@end
