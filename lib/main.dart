import 'package:flutter/material.dart';
import 'package:flutter_app/native_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DefaultPage(),
    );
  }
}

class DefaultPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState()=>DefaultState();
}

class DefaultState extends State<DefaultPage> {
  NativeViewController controller;
  @override
  void initState() {
    controller = NativeViewController();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent,
        appBar: AppBar(title: Text("Default Page")),
        body:  Center(
          child: Container(width: 200, height:200,
              child: SampleView(controller: controller)),
        ),
        floatingActionButton: FloatingActionButton(child: Icon(Icons.change_history), onPressed: ()=>controller.changeBackgroundColor())

    );
  }
}