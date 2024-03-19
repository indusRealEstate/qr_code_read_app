import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:qr_code_reader_app/shared/shared_prefs.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:simple_vcard_parser/simple_vcard_parser.dart';

class QrCodeReaderController extends GetxController {
  QrCodeReaderController();

  ApiClass apiClass = ApiClass();
  SharedPrefs sharedPrefs = SharedPrefs();

  // AllReadingsController allReadingsController =
  //     Get.put(AllReadingsController());

  // AllRegController allRegController = Get.put(AllRegController());

  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  QRViewController? controller;

  bool reading = false;

  RxBool adding = false.obs;

  RxString qrText = 'Please Scan'.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  AllReadingsController getAllReadingsController() {
    return Get.put(AllReadingsController());
  }

  AllRegController getAllRegController() {
    return Get.put(AllRegController());
  }

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      if (scanData.code!.startsWith("BEGIN:VCARD") && reading == false) {
        reading = true;
        var newCard = VCard(scanData.code!);

        var id = newCard.lines[7].toString().split('URL:')[1].trim();

        if (getAllReadingsController()
            .allReadings
            .where((r) => r.uid == id)
            .isEmpty) {
          qrText('Scanned Successfully!');

          Get.defaultDialog(
            title: "Qr Code Detected",
            contentPadding: const EdgeInsets.all(25),
            titlePadding: const EdgeInsets.only(top: 20),
            backgroundColor: Colors.redAccent,
            titleStyle: const TextStyle(color: Colors.white),
            barrierDismissible: false,
            radius: 10,
            content: Column(
              children: [
                const Text(
                  'QR CODE ID:',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                Text(
                  id,
                  style: const TextStyle(color: Colors.white),
                )
              ],
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.white)),
                        onPressed: () {
                          reading = false;
                          Get.back(closeOverlays: true);
                        },
                        child: const Text(
                          'Cancel',
                          style: TextStyle(color: Colors.black),
                        )),
                  ),
                  SizedBox(
                    width: 120,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.green)),
                        onPressed: () async {
                          adding(true);
                          String? userId = await sharedPrefs.getUserID();
                          await apiClass
                              .readQrCode(id, userId!)
                              .then((value) => {
                                    if (value == true)
                                      {
                                        reading = false,
                                        adding(false),
                                        Future.delayed(
                                            const Duration(seconds: 3), () {
                                          qrText('Please Scan');
                                        }),
                                        getAllRegController().onRefresh(),
                                        getAllReadingsController()
                                            .pagingController
                                            .refresh(),
                                        Get.back(closeOverlays: true),
                                        Get.snackbar('Success',
                                            'Qr code added successfully!')
                                      }
                                    else
                                      {
                                        reading = false,
                                        adding(false),
                                        Get.back(closeOverlays: true),
                                        Get.snackbar(
                                            'Error', 'Something went wrong'),
                                      },
                                  });
                        },
                        child: Obx(() => adding.value
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                        Colors.white)),
                              )
                            : const Text(
                                'Add',
                                style: TextStyle(color: Colors.white),
                              ))),
                  ),
                ],
              )
            ],
          );
        } else {
          reading = false;
          qrText('Reading already exist.');
          Future.delayed(const Duration(seconds: 3), () {
            qrText('Please Scan');
          });
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }
}
