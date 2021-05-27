import 'package:flutter/material.dart';
import 'package:flutter_getx_validation/bindings/bindings.dart';
import 'package:flutter_getx_validation/pages/folding_main.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: FoldingCell(),
      initialBinding: MyBindings(),
    );
  }
}

