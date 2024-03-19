import 'package:get/get.dart';
import 'package:qr_code_reader_app/model/user.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/shared/shared_prefs.dart';

class BottomNavbarController extends GetxController {
  BottomNavbarController();

  RxInt currentIndex = 0.obs;

  Rxn<UserModel> userModel = Rxn<UserModel>();

  SharedPrefs sharedPrefs = SharedPrefs();

  RxBool isLogouting = false.obs;

  logout() async {
    Future.delayed(const Duration(seconds: 1), () async {
      await sharedPrefs.removeUserID();
      isLogouting(false);
      Get.offAllNamed(AppRoutes.login);
    });
  }
}
