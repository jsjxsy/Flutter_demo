import 'package:flutter/material.dart';


class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with SingleTickerProviderStateMixin {
  AnimationController _mController;
  Animation _mAnimation;

  @override
  void initState() {
    super.initState();
    _mController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 5000));
    _mAnimation = Tween(begin: 0.0, end: 1.0).animate(_mController);

    _mAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
//        Navigator.pushAndRemoveUntil(
//            context,
//            MaterialPageRoute(builder: (context) => HomePage()),
//                (predicate) => predicate == null);
      }
    });

    _mController.forward();
  }

  @override
  void dispose() {
    super.dispose();
    _mController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _mAnimation,
      child: Image.network(
        "https://cn.bing.com/th?id=OIP.QrNc3F1c8Ki1bUfR5oxqXwHaMW&pid=Api&rs=1&p=0",
        fit: BoxFit.fill,
      ),
    );
  }
}

