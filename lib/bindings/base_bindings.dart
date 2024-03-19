import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:qr_code_reader_app/controller/event_controller.dart';
import 'package:qr_code_reader_app/controller/login_controller.dart';
import 'package:qr_code_reader_app/controller/qr_code_reader_controller.dart';
import 'package:qr_code_reader_app/controller/splash_screen_controller.dart';

class BaseBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashScreenViewController());
    Get.lazyPut(() => LoginController());
    // Get.lazyPut(() => BottomNavbarController());
    Get.lazyPut(() => QrCodeReaderController());
    Get.lazyPut(() => AllReadingsController());
    Get.lazyPut(() => AllRegController());
    Get.lazyPut(() => EventController());
  }
}
