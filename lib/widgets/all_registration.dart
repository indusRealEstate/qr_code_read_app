import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:qr_code_reader_app/model/client.dart';

class AllRegWidget extends GetView<AllRegController> {
  const AllRegWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx((state) {
      return Column(
        children: [
          Obx(
            () => Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Registered Clients: ${controller.totalClientsCount.value}',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Clients Showed Up: ${controller.totalClientsCountReg.value}',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        'Clients Not Showed Up: ${controller.totalClientsCountUnReg.value}',
                        style: TextStyle(
                          color: Colors.green[700],
                          fontWeight: FontWeight.w600,
                          fontSize: 17,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      controller.filterOn.value = !controller.filterOn.value;
                      controller.onRefresh();

                      if (controller.filterOn.value) {
                        Get.snackbar('Filter On',
                            'Filter has been applied to the list.');
                      } else {
                        Get.snackbar('Filter Off',
                            'Filter has been removed from the list.');
                      }
                    },
                    icon: Icon(controller.filterOn.value
                        ? Icons.filter_alt
                        : Icons.filter_alt_off),
                  ),
                ],
              ),
            ),
          ),
          Obx(
            () => controller.filterOn.value
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                controller.filter.value == 'reg'
                                    ? Colors.orange
                                    : Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.filter('reg');
                            controller.onRefresh();
                          },
                          child: const Text(
                            'Show Registered',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                controller.filter.value == 'non-reg'
                                    ? Colors.orange
                                    : Colors.grey),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          onPressed: () {
                            controller.filter('non-reg');
                            controller.onRefresh();
                          },
                          child: const Text(
                            'Show Unregistered',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox(),
          ),
          Expanded(
            child: PagedListView<int, ClientModel>(
              pagingController: controller.pagingController,
              builderDelegate: PagedChildBuilderDelegate<ClientModel>(
                itemBuilder: (context, item, index) => GestureDetector(
                  onTap: () {
                    controller.goToDetailsPage(item);
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
                    trailing: item.qrCodeRead == '0'
                        ? const Icon(
                            Icons.beenhere_outlined,
                            color: Colors.grey,
                          )
                        : const Icon(
                            Icons.beenhere,
                            color: Colors.green,
                          ),
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
