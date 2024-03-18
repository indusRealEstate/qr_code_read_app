import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:qr_code_reader_app/controller/all_readings_controller.dart';
import 'package:qr_code_reader_app/db/vcard.dart';

class AllReadingsWidget extends StatelessWidget {
  const AllReadingsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AllReadingsController>(
      init: AllReadingsController(),
      builder: (controller) {
        return controller.obx(
          (state) => _buildUI(state, controller),
          onError: (error) => const Center(child: Text("Error")),
          onLoading: const Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget _buildUI(Box<VCardHive>? state, AllReadingsController controller) {
    if (state != null) {
      if (state.isNotEmpty) {
        return Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              'Total Readings: ${state.length}',
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
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: state.length,
                itemBuilder: (context, index) {
                  VCardHive vCard = state.getAt(index)!;
                  return GestureDetector(
                    onTap: () {
                      // controller.goToDetailsPage(vCard);
                    },
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(vCard.name),
                      subtitle: Text(vCard.uid),
                      trailing: IconButton(
                          onPressed: () {
                            Get.defaultDialog(
                                barrierDismissible: false,
                                title: "Delete Reading",
                                contentPadding: const EdgeInsets.all(25),
                                titlePadding: const EdgeInsets.only(top: 20),
                                content: Text(
                                    'Are you sure to delete this reading ID : ${vCard.uid}.'),
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
                                              style: TextStyle(
                                                  color: Colors.black),
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
                                                .deleteReading(vCard.uid)
                                                .then((value) => {
                                                      controller
                                                          .deleting(false),
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
                  );
                },
              ),
            ),
          ],
        );
      } else {
        return const Center(
            child: Text(
          'No Readings',
          style: TextStyle(
            fontSize: 20,
          ),
        ));
      }
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }
}
