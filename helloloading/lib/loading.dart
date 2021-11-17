import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// 加载遮罩组件
class Loading extends StatelessWidget {
  const Loading({
    Key? key,
    required this.child,
    required this.isLoading,
    this.message = "",
    this.maskOpacity = 0.2,
    this.maskColor = Colors.lightBlueAccent,
    this.maskDismissible = true,
  })  : assert(maskOpacity >= 0.0 && maskOpacity <= 1.0),
        super(key: key);

  // 子组件（非空）
  final Widget child;
  // 是否加载中（非空） true: 加载中 false：非加载中
  final bool isLoading;
  // 遮罩层显示的信息
  final String message;
  // 遮罩层的透明度(0.0 ~ 1.0) 默认0.2
  final double maskOpacity;
  // 遮罩层的颜色 默认 Colors.lightBlueAccent
  final Color maskColor;
  // 点击遮罩层 pop 路由 true: pop(默认), false: 不pop
  final bool maskDismissible;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Visibility(
          visible: isLoading,
          child: ModalBarrier(
              color: maskColor.withOpacity(maskOpacity),
              dismissible: maskDismissible),
        ),
        isLoading
            ? Center(
                child: message == ""
                    ? const CircularProgressIndicator()
                    : Container(
                        margin: const EdgeInsets.all(16.0),
                        height: 160,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(128, 128, 128, 0.2),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(),
                            Center(
                              child: Container(
                                margin: const EdgeInsets.all(8.0),
                                padding: const EdgeInsets.all(8.0),
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromRGBO(196, 196, 196, 1.0),
                                  borderRadius: BorderRadius.circular(4.0),
                                ),
                                child: Text(message,
                                    overflow: TextOverflow.ellipsis,
                                    style:
                                        Theme.of(context).textTheme.bodyText1),
                              ),
                            ),
                          ],
                        ),
                      ),
              )
            : Container(),
      ],
    );
  }
}
