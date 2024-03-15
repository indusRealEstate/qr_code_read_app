import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/bottom_nav_controller.dart';
import 'package:qr_code_reader_app/widgets/all_readings.dart';
import 'package:qr_code_reader_app/widgets/qr_code_reader.dart';
import 'package:qr_code_reader_app/widgets/all_registration.dart';

class BottomNavbarWidget extends GetView<BottomNavbarController> {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Reader'),
      ),
      floatingActionButton: Obx(() => controller.currentIndex.value == 1 &&
              controller.allReadingsController.allCards.isNotEmpty
          ? SizedBox(
              width: 100,
              child: FloatingActionButton(
                onPressed: () => controller.clearAllReadings(),
                backgroundColor: Colors.red[400],
                child: const Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Text(
                    'Delete All',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            )
          : const SizedBox()),
      body: Obx(() => getPage(controller.currentIndex.value)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code),
                label: 'Reader',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.list),
                label: 'All Readings',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people),
                label: 'All Registration',
              ),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.amber[800],
            onTap: (value) {
              controller.currentIndex(value);
            },
          )),
    );
  }
}

Widget getPage(index) {
  switch (index) {
    case 0:
      return const QrCodeReaderWidget();
    case 1:
      return const AllReadingsWidget();
    case 2:
      return const AllRegWidget();
    default:
      return const QrCodeReaderWidget();
  }
}
