import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';

class ReadingDetailsPage extends GetView<AllReadingsController> {
  const ReadingDetailsPage({super.key});

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
            Row(
              children: [
                const Text(
                  'Name : ',
                  style: TextStyle(fontSize: 20),
                ),
                Flexible(
                  child: Text(
                    controller.selectedCard.name,
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
                    controller.selectedCard.contactNo,
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
                    controller.selectedCard.email,
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
                    controller.selectedCard.uid,
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
