import 'package:flutter/material.dart';

import 'app_icons.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('自定义图标(图片转SVG图标)'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 20, color: Colors.red)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 30, color: Colors.orange)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 40, color: Colors.yellow)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 50, color: Colors.green)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 60, color: Colors.blue)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 70, color: Colors.indigo)),
            Padding(padding: EdgeInsets.all(8.0), child: Icon(AppIcons.panda, size: 80, color: Colors.purple)),
          ],
        ),
      ),
    );
  }
}
