import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/qr_code_reader_controller.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrCodeReaderWidget extends GetView<QrCodeReaderController> {
  const QrCodeReaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
          ),
        ),
        Expanded(
          flex: 2,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(
                  () => Text(
                    controller.qrText.value,
                    style:  TextStyle(
                      fontSize: Get.theme.textTheme.titleMedium!.fontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Card(
                    color: Colors.blue[100],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child:  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info),
                          const SizedBox(
                            width: 10,
                          ),
                          Flexible(
                            child: Text(
                              'Please hold camera near to the QR code until the dialog popup.',
                              style: TextStyle(
                                fontSize: Get.theme.textTheme.labelLarge!.fontSize,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
