import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_reader_app/db/boxes.dart';
import 'package:qr_code_reader_app/db/vcard.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';

class AllReadingsController extends GetxController with StateMixin {
  AllReadingsController();

  late Box<VCardHive> allCards;

  late VCardHive selectedCard;

  @override
  Future<void> onInit() async {
    super.onInit();
    allCards = vcardBox;
    change(vcardBox, status: RxStatus.success());
  }

  Future<void> clearAllReadings() async {
    await allCards.clear();
    change(allCards, status: RxStatus.success());
  }

  void goToDetailsPage(VCardHive card) {
    selectedCard = card;
    Get.toNamed(AppRoutes.readingDetails);
  }

  Future<void> deleteReading(id) async {
    await allCards.delete(id);
    change(allCards, status: RxStatus.success());
  }
}
