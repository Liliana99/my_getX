import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_validation/pages/folding_main.dart';

import 'package:get/get.dart';

class SplashView extends StatelessWidget {
  bool isVisible = false;
  void _back() {
    Get.off(FoldingCell());
  }

  void _waitAndGo() {
    Future.delayed(Duration(seconds: 3)).then((value) => _back());
  }

  Widget _buildButton() {
    return TextButton(
      style: TextButton.styleFrom(
        primary: Colors.blue,
        onSurface: Colors.red,
      ),
      onPressed: () => _back(),
      child: Text('Back Home'),
    );
  }

  @override
  Widget build(BuildContext context) {
    _waitAndGo();
    return Scaffold(
      body: Container(
        child: Center(child: Image.asset('assets/splash.gif')),
      ),
    );
  }
}
