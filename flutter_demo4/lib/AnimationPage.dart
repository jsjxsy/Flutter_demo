import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation Page"),
      ),
      body: CustomTweenAnimation(), // Center(child: CustomTweenAnimation()),
//          Row(
//          children: <Widget>[
//            CustomTweenAnimation(),
//            AnimationWidget()
//          ],
    );
  }
}

class AnimationWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    return AnimationView();
  }
}

/**
 *
 */
class AnimationView extends State<AnimationWidget>
    with SingleTickerProviderStateMixin {
//  var controller;
//  var curve;
  AnimationController controller;
  CurvedAnimation curve;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    //动画的类型：TWEEN 还是平移 缩放 旋转
    //定义VIew
    var scaled = ScaleTransition(
      child: FlutterLogo(size: 200.0),
      scale: curve,
    );
    return FadeTransition(
      child: scaled,
      opacity: curve,
    );
  }

  @override
  void initState() {
    //动画的控制：时长 线性
    controller = AnimationController(
      duration: Duration(seconds: 10),
      debugLabel: "this is test",
      vsync: this,
    );

    curve = CurvedAnimation(
      parent: controller,
      // 更多的效果，参考 https://docs.flutter.io/flutter/animation/Curves-class.html
      curve: Curves.easeInOut,
    );
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
  }
}

class CustomTweenAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CustomTweenState();
  }
}

class CustomTweenState extends State<CustomTweenAnimation>
    with SingleTickerProviderStateMixin {
  static const padding = 16.0;
  AnimationController controller;
  Animation left;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future(initAnimation);
  }

  void initAnimation() {
    controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    final mediaQueryData = MediaQuery.of(context);
    final screenWidth = mediaQueryData.size.width;
    debugPrint("screenWidth=${screenWidth}");
    left = Tween(begin: padding, end: screenWidth - padding).animate(controller)
      ..addListener(() {
        debugPrint("Tween");
        //不停的执行
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          controller.forward();
        }
      });

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // 假定一个单位是 24
    final unit = 24.0;
    final marginLeft = left == null ? padding : left.value;

    // 把 marginLeft 单位化
    final unitizedLeft = (marginLeft - padding) / unit;
    final unitizedTop = math.sin(unitizedLeft);
    // unitizedTop + 1 是了把 [-1, 1] 之间的值映射到 [0, 2]
    // (unitizedTop+1) * unit 后把单位化的值转回来
    final marginTop = (unitizedTop + 1) * unit + padding;
    debugPrint("left:${marginLeft}, top:${marginTop}");
    return Container(
      // 我们根据动画的进度设置圆点的位置
      margin: EdgeInsets.only(left: marginLeft, top: marginTop),
      // 画一个小红点
      child: Container(
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(7.5)),
        width: 15.0,
        height: 15.0,
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }
}
