import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:sunset_time/src/model/sunsetTime.dart';
import 'package:xml/xml.dart';
import 'package:sunset_time/src/geo/loading.dart';
import 'package:http/http.dart';

class SunsetTimeRepository {
  final dateStr = DateFormat('yyyyMMdd').format(DateTime.now());
  late var _dio;

  Future<String> getLocation() async {
    String lati = '';
    String long = '';
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      lati = position.latitude.toString();
      long = position.longitude.toString();

      return lati + " " + long;
    } catch (e) {
      String err = 'error';
      print("there was an error");
      return err;
    }
  }

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
    String long = locList.split(" ")[0];
    String lati = locList.split(" ")[1];
    print(long);
    print(lati);
    print(locList);
    var response = await get(Uri.parse(
        'http://apis.data.go.kr/B090041/openapi/service/RiseSetInfoService/getLCRiseSetInfo?ServiceKey=cR1YY2ji2HzxD35o6BnH7GgH46ViNYaXmUFWJ%2FKKXc%2BMYcZNA51AWWyKOPorXp8pHJ6gBLiaXzJ809NDVwgNSg%3D%3D&locdate=${dateStr}&longitude=${lati}&latitude=${long}&dnYn=Y'));
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
