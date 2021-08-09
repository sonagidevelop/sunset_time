import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sunset_time/src/model/sunsetTime.dart';
import 'package:xml/xml.dart';
import 'package:sunset_time/src/geo/loading.dart';

class SunsetTimeRepository {
  final dateStr = DateFormat('yyyyMMdd').format(DateTime.now());
  late var _dio;

  SunsetTimeRepository() {
    _dio = Dio(
      BaseOptions(
        baseUrl: "http://apis.data.go.kr",
        queryParameters: {
          'ServiceKey':
              'cR1YY2ji2HzxD35o6BnH7GgH46ViNYaXmUFWJ/KKXc+MYcZNA51AWWyKOPorXp8pHJ6gBLiaXzJ809NDVwgNSg==',
          'locdate': dateStr,
          'longitude': '126.3423535',
          'latitude': '37.5600355',
          'dnYn': 'Y'
        },
      ),
    );
  }
  Future<SunSetTimeModel> fetchSunSetTime() async {

    print("hello");
    var locList = await getLocation();
    String lati = locList.split(" ")[0];
    String long = locList.split(" ")[1];
    print(long);
    print(lati);
    var response = await get(Uri.parse(
        'http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getLCRiseSetInfo?ServiceKey=cR1YY2ji2HzxD35o6BnH7GgH46ViNYaXmUFWJ%2FKKXc%2BMYcZNA51AWWyKOPorXp8pHJ6gBLiaXzJ809NDVwgNSg%3D%3D&locdate=20210809&longitude=${long}&latitude=${lati}&dnYn=Y'));
    print(response.body);
    final document = XmlDocument.parse(response.body);

    final results = document.findAllElements('item');
    if (results.isNotEmpty) {
      return SunSetTimeModel.fromXml(results.first);
    } else {
      return Future.value(null);
    }
  }
}
