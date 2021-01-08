package com.story5.flutter_app;

import android.net.Uri;
import android.os.Bundle;
import android.content.Intent;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        // 1.创建与调用方标识符一样的方法通道
        new MethodChannel(getFlutterView(),"samples.story5/utils").setMethodCallHandler(
                // 设置方法处理回调
                new MethodChannel.MethodCallHandler() {
                    // 响应方法请求
                    @Override
                    public void onMethodCall(@NonNull MethodCall call, @NonNull MethodChannel.Result result) {
                        // 2.判断方法名是否支持(openAppStore)
                        if (call.method.equals("openAppStore")) {
                            try {
                                //应用市场URI
                                Uri uri = Uri.parse("market://details?id=com.tencent.mm");
                                Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                                intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
                                //打开应用市场
                                startActivity(intent);
                            } catch (Exception e) {
                                //打开应用市场出现异常
                                result.error("UNAVAILABLE", "没有安装应用市场", null);
                            }
                        } else {
                            //打开应用市场出现异常
                            result.notImplemented();
                        }
                    }
                }
        );
    }
}
