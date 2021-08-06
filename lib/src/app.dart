import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sunset_time/src/controller/sunsetTime_controller.dart';

class App extends GetView<SunSetTimeController> {
  const App({Key? key}) : super(key: key);

  Widget infoWidget(String title, String value) {
    // final dateStr = DateFormat('yyyyMMdd').format(DateTime.now());
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          // Text(dateStr),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Text(
            " : $value",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('오늘의 일출 일몰'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Obx(() {
          var info = controller.sunsetTime.value;
          return Column(
            children: [
              infoWidget("날짜", info.locdate ?? ''),
              infoWidget("일출", info.sunrise ?? ''),
              infoWidget("일몰", info.sunset ?? ''),
            ],
          );
        }),
      ),
    );
  }
}
