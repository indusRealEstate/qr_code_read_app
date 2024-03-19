import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';
import 'package:qr_code_reader_app/controller/bottom_nav_controller.dart';
import 'package:qr_code_reader_app/controller/event_controller.dart';
import 'package:qr_code_reader_app/controller/qr_code_reader_controller.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavbarController());
    Get.put(QrCodeReaderController());
    Get.put(AllReadingsController());
    Get.lazyPut(() => AllRegController());
    Get.lazyPut(() => EventController());
  }
}
