import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SampleView extends StatefulWidget {
  const SampleView({
    Key key,
    this.controller,
  }) : super(key: key);

  final NativeViewController controller;

  @override
  State<StatefulWidget> createState() => _SampleViewState();
}

class _SampleViewState extends State<SampleView> {

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return AndroidView(
        viewType: 'SampleView',
        onPlatformViewCreated: _onPlatformViewCreated,
      );
    } else {
      return UiKitView(viewType: 'SampleView',
          onPlatformViewCreated: _onPlatformViewCreated
      );
    }
  }

  _onPlatformViewCreated(int id)=> widget.controller?.onCreate(id);
}



class NativeViewController {
  MethodChannel _channel;
  onCreate(int id) {
    _channel = MethodChannel('samples.story5/native_views_$id');
  }

  changeBackgroundColor() async
  {
    int result = await _channel.invokeMethod('changeBackgroundColor');
    print(result);
  }
}