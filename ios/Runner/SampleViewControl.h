//
//  SampleViewControl.h
//  Runner
//
//  Created by story5 on 2021/1/8.
//

#import <Foundation/Foundation.h>
#import <Flutter/Flutter.h>

NS_ASSUME_NONNULL_BEGIN

// 平台视图封装类
@interface SampleViewControl : NSObject<FlutterPlatformView>

- (instancetype)initWithWithFrame:(CGRect)frame viewIdentifier:(int64_t)viewId arguments:(id _Nullable)args binaryMessenger:(NSObject<FlutterBinaryMessenger>*)messenger;

@end

NS_ASSUME_NONNULL_END
