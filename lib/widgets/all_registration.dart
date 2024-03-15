import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';

class AllRegWidget extends GetView<AllRegController> {
  const AllRegWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('All Registration'),
    );
  }
}
