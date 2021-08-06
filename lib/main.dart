import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sunset_time/src/app.dart';
import 'package:sunset_time/src/controller/sunsetTime_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      initialBinding: BindingsBuilder(() {
        Get.put(SunSetTimeController());
      }),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: App(),
    );
  }
}
