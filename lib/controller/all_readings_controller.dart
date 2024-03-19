import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:qr_code_reader_app/db/boxes.dart';
import 'package:qr_code_reader_app/db/vcard.dart';

class AllReadingsController extends GetxController with StateMixin {
  AllReadingsController();

  late Box<VCardHive> allCards;

  late VCardHive selectedCard;

  ApiClass apiClass = ApiClass();

  AllRegController allRegController = Get.put(AllRegController());

  RxBool deleting = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    allCards = vcardBox;
    change(vcardBox, status: RxStatus.success());
  }

  // Future<void> clearAllReadings() async {
  //   await allCards.clear();
  //   change(allCards, status: RxStatus.success());
  // }

  // void goToDetailsPage(VCardHive card) {
  //   allRegController.selectedReg =
  //       allRegController.clients.where((cl) => cl.uid == card.uid).first;
  //   Get.toNamed(AppRoutes.regDetails);
  // }

  Future<void> deleteReading(id) async {
    await apiClass.removeQrCodeReading(id);
    await allCards.delete(id);
    allRegController.onRefresh();
    change(allCards, status: RxStatus.success());
  }
}
