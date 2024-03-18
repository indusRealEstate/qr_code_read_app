import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:intl/intl.dart';

class RegDetailsPage extends GetView<AllRegController> {
  const RegDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registration Details',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 240,
              color: Colors.blue,
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    const CircleAvatar(
                      radius: 45,
                      child: Icon(
                        Icons.person,
                        size: 60,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      controller.selectedReg.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
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
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20),
              child: Column(
                children: [
                  RegContentWidget(
                    controller: controller,
                    isContact: true,
                    content: controller.selectedReg.contactNo,
                    title: 'Contact No',
                    icon: Icons.call,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RegContentWidget(
                    controller: controller,
                    isContact: false,
                    content: controller.selectedReg.email == ''
                        ? 'N/A'
                        : controller.selectedReg.email,
                    title: 'E-Mail',
                    icon: Icons.email_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RegContentWidget(
                    controller: controller,
                    isContact: false,
                    content: controller.selectedReg.source,
                    title: 'Source',
                    icon: Icons.insert_chart_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RegContentWidget(
                    controller: controller,
                    isContact: false,
                    content: controller.selectedReg.uid,
                    title: 'UID',
                    icon: Icons.info_outlined,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RegContentWidget(
                    controller: controller,
                    isContact: false,
                    content: DateFormat('yyyy-MM-dd EEEE hh:mm a')
                        .format(controller.selectedReg.timestamp),
                    title: 'Registered On',
                    icon: Icons.date_range_outlined,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class RegContentWidget extends StatelessWidget {
  const RegContentWidget({
    super.key,
    required this.controller,
    required this.isContact,
    required this.icon,
    required this.title,
    required this.content,
  });

  final AllRegController controller;
  final bool isContact;
  final IconData icon;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (isContact) {
          controller.makePhoneCall(controller.selectedReg.contactNo);
        }
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(icon),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          content,
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
