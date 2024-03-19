import 'package:get/get.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/controller/bottom_nav_controller.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/shared/shared_prefs.dart';

class SplashScreenViewController extends GetxController {
  SharedPrefs sharedPrefs = SharedPrefs();

  ApiClass apiClass = ApiClass();

  @override
  void onInit() async {
    super.onInit();

    String? userId = await sharedPrefs.getUserID();

    if (userId != null) {
      final BottomNavbarController bottomNavigationController =
          Get.put(BottomNavbarController(), permanent: true);

      await apiClass
          .getUser(userId)
          .then((value) => {
                bottomNavigationController.userModel(value),
              })
          .then((_) => {
                print(bottomNavigationController.userModel.value),
                // Future.delayed(const Duration(seconds: 5), () {
                Get.offAllNamed(AppRoutes.base),
                // }),
              });
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }
}
