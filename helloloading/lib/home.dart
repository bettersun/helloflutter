import 'package:flutter/material.dart';

import 'hello.dart';
import 'loading.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => const Loading(child: Hello(), isLoading: true)));
              },
              child: const Text("Hello"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Loading(
                      child: Hello(),
                      isLoading: true,
                      message: "加载中加载中加载中加载中加载中加载中加载中",
                    ),
                  ),
                );
              },
              child: const Text("Message"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Loading(
                      child: Hello(),
                      isLoading: false,
                      message: "加载中加载中加载中加载中加载中加载中加载中",
                    ),
                  ),
                );
              },
              child: const Text("None"),
            ),
          ],
        ),
      ),
    );
  }
}
