import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/bottom_nav_controller.dart';
import 'package:qr_code_reader_app/widgets/all_readings.dart';
import 'package:qr_code_reader_app/widgets/event_widget.dart';
import 'package:qr_code_reader_app/widgets/qr_code_reader.dart';
import 'package:qr_code_reader_app/widgets/all_registration.dart';

class BottomNavbarWidget extends GetView<BottomNavbarController> {
  const BottomNavbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'QR Code Reader',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0),
            child: Text(
              'v1.0.0',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Obx(() => getPage(controller.currentIndex.value)),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            elevation: 20,
            backgroundColor: Colors.white,
            unselectedItemColor: Colors.grey,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.qr_code,
                ),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.event_note),
                label: 'Event',
              ),
            ],
            currentIndex: controller.currentIndex.value,
            selectedItemColor: Colors.blue,
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
    case 3:
      return const EventWidget();
    default:
      return const QrCodeReaderWidget();
  }
}
