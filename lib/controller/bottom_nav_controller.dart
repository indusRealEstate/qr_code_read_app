import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';

class BottomNavbarController extends GetxController {
  BottomNavbarController();

  AllReadingsController allReadingsController =
      Get.put(AllReadingsController());

  RxInt currentIndex = 0.obs;

  Future<void> clearAllReadings() async {
    await allReadingsController.clearAllReadings();
  }
}
