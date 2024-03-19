import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:qr_code_reader_app/model/client.dart';

class AllReadingsWidget extends GetView<AllReadingsController> {
  const AllReadingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            'Total Readings: ${controller.allReadings.length}',
            style: TextStyle(
              color: Colors.green[700],
              fontWeight: FontWeight.w600,
              fontSize: 17,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: PagedListView<int, ClientModel>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ClientModel>(
                itemBuilder: (context, item, index) => GestureDetector(
                  onTap: () {
                    // controller.goToDetailsPage(item);
                  },
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(item.name),
                    subtitle: Text(item.uid),
                    trailing: IconButton(
                        onPressed: () {
                          Get.defaultDialog(
                              barrierDismissible: false,
                              title: "Delete Reading",
                              contentPadding: const EdgeInsets.all(25),
                              titlePadding: const EdgeInsets.only(top: 20),
                              content: Text(
                                  'Are you sure to delete this reading ID : ${item.uid}.'),
                              actions: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 120,
                                      child: ElevatedButton(
                                          style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.white)),
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text(
                                            'Cancel',
                                            style:
                                                TextStyle(color: Colors.black),
                                          )),
                                    ),
                                    SizedBox(
                                      width: 120,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                            backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red)),
                                        onPressed: () async {
                                          controller.deleting(true);
                                          await controller
                                              .deleteReading(item.uid)
                                              .then((value) => {
                                                    controller.deleting(false),
                                                    Get.back(
                                                        closeOverlays: true),
                                                  });
                                          Get.snackbar('Success',
                                              'Qr code deleted successfully!');
                                        },
                                        child: Obx(
                                          () => controller.deleting.value
                                              ? const SizedBox(
                                                  width: 20,
                                                  height: 20,
                                                  child: CircularProgressIndicator(
                                                      valueColor:
                                                          AlwaysStoppedAnimation<
                                                                  Color>(
                                                              Colors.white)),
                                                )
                                              : const Text(
                                                  'Delete',
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                        ),
                                      ),
                                    )
                                  ],
                                )
                              ]);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
