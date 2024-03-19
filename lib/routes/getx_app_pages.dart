import 'package:get/get.dart';
import 'package:qr_code_reader_app/bindings/base_bindings.dart';
import 'package:qr_code_reader_app/page/login_page.dart';
import 'package:qr_code_reader_app/page/reg_details.dart';
import 'package:qr_code_reader_app/page/splash_screen.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/widgets/bottom_nav.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.splashScreen,
      page: () => const SplashScreen(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.base,
      page: () => const BottomNavbarWidget(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.regDetails,
      page: () => const RegDetailsPage(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
  ];
}
