import 'package:get/get.dart';
import 'package:sunset_time/src/model/sunsetTime.dart';
import 'package:sunset_time/src/repository/sunsetTime_repository.dart';

class SunSetTimeController extends GetxController {
  late SunsetTimeRepository _sunsetTimeRepository;
  Rx<SunSetTimeModel> sunsetTime = SunSetTimeModel().obs;

  @override
  void onInit() {
    super.onInit();
    _sunsetTimeRepository = SunsetTimeRepository();
    fetchSunsetState();
  }

  void fetchSunsetState() async {
    var result = await _sunsetTimeRepository.fetchSunSetTime();
    if (result != null) {
      sunsetTime(result);
    }
  }
}
