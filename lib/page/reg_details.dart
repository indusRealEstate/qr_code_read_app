import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';

class RegDetailsPage extends GetView<AllRegController> {
  const RegDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Reader'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        controller.selectedReg.qrCodeRead == '1'
                            ? 'Showed up'
                            : 'Not Showed Up',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        controller.selectedReg.qrCodeRead == '1'
                            ? Icons.beenhere
                            : Icons.beenhere_outlined,
                        color: controller.selectedReg.qrCodeRead == '1'
                            ? Colors.green
                            : Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                const Text(
                  'Name : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedReg.name,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Contact No : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedReg.contactNo,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Email : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedReg.email,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                const Text(
                  'Source : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedReg.source,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'UID : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedReg.uid,
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
