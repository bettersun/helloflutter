import 'package:flutter/material.dart';

import 'anchor/export.dart';

void main() {
  runApp(const AnchorApp());
}

class AnchorApp extends StatelessWidget {
  const AnchorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: '点击锚点跳转到对应位置'),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<AnchorProperty> anchorProperties = [];
  List<Anchor> anchors = [];

  @override
  void initState() {
    anchorProperties.add(AnchorProperty(id: '1', label: '人物'));
    anchorProperties.add(AnchorProperty(id: '2', label: '风光'));
    anchorProperties.add(AnchorProperty(id: '3', label: '建筑'));
    anchorProperties.add(AnchorProperty(id: '4', label: '运动'));

    anchors = AnchorHelper.anchorList(anchorProperties);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              anchors.isNotEmpty ? anchors[0] : Container(),
              Container(
                  height: 400,
                  color: Colors.teal,
                  child: const Center(child: Text('人物相关内容'))),
              anchors.isNotEmpty ? anchors[1] : Container(),
              Container(
                  height: 400,
                  color: Colors.orangeAccent,
                  child: const Center(child: Text('风光相关内容'))),
              anchors.isNotEmpty ? anchors[2] : Container(),
              Container(
                  height: 400,
                  color: Colors.indigoAccent,
                  child: const Center(child: Text('建筑相关内容'))),
              anchors.isNotEmpty ? anchors[3] : Container(),
              Container(
                  height: 400,
                  color: Colors.lime,
                  child: const Center(child: Text('运动相关内容'))),
            ],
          ),
        ),
      ),
    );
  }
}
