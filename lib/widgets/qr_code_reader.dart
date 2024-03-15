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
          flex: 5,
          child: QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Obx(() => Text(controller.qrText.value)),
          ),
        )
      ],
    );
  }
}
