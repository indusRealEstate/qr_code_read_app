import 'package:get/get.dart';
import 'package:qr_code_reader_app/bindings/base_bindings.dart';
import 'package:qr_code_reader_app/page/reading_details.dart';
import 'package:qr_code_reader_app/page/reg_details.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';
import 'package:qr_code_reader_app/widgets/bottom_nav.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.base,
      page: () => const BottomNavbarWidget(),
      binding: BaseBindings(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: AppRoutes.readingDetails,
      page: () => const ReadingDetailsPage(),
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
