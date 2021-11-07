import 'package:flutter/material.dart';

import 'color_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: '对比度计算例'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // 对比度AAA标准边界值： 7
  double contrastRatioLimit = 7.0;
  // 对比度计算结果
  num contrastRatio = 0.0;
  // 对比度计算结果（字符串）
  String sContrastRatio = "";

  // 红色通道
  double red = 255;
  // 绿色通道
  double green = 255;
  // 蓝色通道
  double blue = 255;

  // 背景色
  Color colorBackground = Colors.transparent;
  // 文字颜色
  Color colorText = Colors.black;
  // 文字内容
  String txt = "";

  // 转换为16进制的2位数
  String toHexString(double v) {
    return v.round().toRadixString(16).toString().padLeft(2, "0");
  }

  // 更新画面颜色和数值
  void updateColor() {
    // 背景色
    colorBackground =
        Color.fromRGBO(red.toInt(), green.toInt(), blue.toInt(), 1.0);
    // 对比度计算结果
    contrastRatio =
        ColorUtil.calcColorContrastRatio(colorBackground, Colors.black);
    sContrastRatio = contrastRatio.toStringAsFixed(2);
    // 文字颜色
    colorText =
        contrastRatio > contrastRatioLimit ? Colors.black : Colors.white;
    // 文字内容
    txt = contrastRatio > contrastRatioLimit
        ? "(相对于黑色)对比度【$sContrastRatio】大于7，文字颜色设为黑色"
        : "(相对于黑色)对比度【$sContrastRatio】小于7，文字颜色设为白色";
  }

  // 改变红色通道值
  void selectRed(double r) {
    setState(() {
      red = r;
      updateColor();
    });
  }

  // 改变绿色通道值
  void selectGreen(double g) {
    setState(() {
      green = g;
      updateColor();
    });
  }

  // 改变蓝色通道值
  void selectBlue(double b) {
    setState(() {
      blue = b;
      updateColor();
    });
  }

  @override
  void initState() {
    super.initState();

    // 初始化
    updateColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  color: colorBackground,
                  child: Text(
                    txt,
                    style: TextStyle(color: colorText),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text(red.toInt().toString()),
                ),
                Expanded(
                  child: Slider(
                    value: red,
                    min: 0,
                    max: 255,
                    activeColor: Colors.redAccent,
                    onChanged: (double value) {
                      selectRed(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text(green.toInt().toString()),
                ),
                Expanded(
                  child: Slider(
                    value: green,
                    min: 0,
                    max: 255,
                    activeColor: Colors.lightGreen,
                    onChanged: (double value) {
                      selectGreen(value);
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  width: 30,
                  child: Text(blue.toInt().toString()),
                ),
                Expanded(
                  child: Slider(
                    value: blue,
                    min: 0,
                    max: 255,
                    activeColor: Colors.lightBlue,
                    onChanged: (double value) {
                      selectBlue(value);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
