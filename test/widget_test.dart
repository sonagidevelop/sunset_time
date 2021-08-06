// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:sunset_time/src/model/sunsetTime.dart';
import 'package:xml/xml.dart';

void main() {
  final bookshelfXml =
      '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<response>
    <header>
        <resultCode>00</resultCode>
        <resultMsg>NORMAL SERVICE.</resultMsg>
    </header>
    <body>
        <items>
            <item>
                <aste>2117  </aste>
                <astm>0358  </astm>
                <civile>2005  </civile>
                <civilm>0510  </civilm>
                <latitude>3733</latitude>
                <latitudeNum>37.5500000</latitudeNum>
                <location>서울</location>
                <locdate>20210805</locdate>
                <longitude>12658</longitude>
                <longitudeNum>126.9666660</longitudeNum>
                <moonrise>0205  </moonrise>
                <moonset>1727  </moonset>
                <moontransit>0945  </moontransit>
                <naute>2040  </naute>
                <nautm>0436  </nautm>
                <sunrise>0539  </sunrise>
                <sunset>1936  </sunset>
                <suntransit>123805</suntransit>
            </item>
        </items>
        <numOfRows>10</numOfRows>
        <pageNo>1</pageNo>
        <totalCount>1</totalCount>
    </body>
</response>''';

  test('노을시간', () {
    final document = XmlDocument.parse(bookshelfXml);
    final items = document.findAllElements('item');
    var sunsetTime = <SunSetTimeModel>[];
    items.forEach((node) {
      sunsetTime.add(SunSetTimeModel.fromXml(node));
    });
    print(sunsetTime.length);
    sunsetTime.forEach((sstalarm) {
      print('${sstalarm.locdate} : ${sstalarm.sunset}');
    });
    // titles.map((node) => node.text).forEach(print);
  });
}
