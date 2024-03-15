import 'package:get/get.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';

class AllRegController extends GetxController {
  AllRegController();

  ApiClass apiClass = ApiClass();

  @override
  void onInit() {
    print('all reg init...');
    super.onInit();

    // await apiClass.getAllClients(10, 1, '').then((value) => print(value));
  }
}
