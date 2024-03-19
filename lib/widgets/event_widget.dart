import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:qr_code_reader_app/controller/event_controller.dart';
import 'package:shimmer/shimmer.dart';

class EventWidget extends GetView<EventController> {
  const EventWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.network(
                  'https://indusre.ae/reg-form-jaipur-api/media/${controller.eventDetails.value!.image}',
                  fit: BoxFit.cover,
                  alignment: Alignment.bottomCenter,
                  loadingBuilder: (context, child, loadingProgress) =>
                      loadingProgress == null
                          ? child
                          : SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: 200.0,
                              child: Shimmer.fromColors(
                                baseColor:
                                    const Color.fromARGB(255, 190, 190, 190),
                                highlightColor:
                                    const Color.fromARGB(255, 255, 255, 255),
                                child: Container(
                                  height: 20,
                                  width: 100,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.eventDetails.value!.title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Card(
                        elevation: 0,
                        color: const Color(0xfff0eaf9),
                        margin: const EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(3)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 2.0, horizontal: 13),
                          child: Column(
                            children: [
                              Text(
                                DateFormat('MMM').format(
                                    controller.eventDetails.value!.date),
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.orange[800],
                                ),
                              ),
                              Text(
                                DateFormat('dd').format(
                                    controller.eventDetails.value!.date),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            DateFormat('EEEE')
                                .format(controller.eventDetails.value!.date),
                            style: const TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                DateFormat('hh:mm a').format(
                                    controller.eventDetails.value!.startTime),
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                              const Text(' - '),
                              Text(
                                DateFormat('hh:mm a').format(
                                    controller.eventDetails.value!.endTime),
                                style: TextStyle(color: Colors.grey[600]),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 17,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        'Location',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(controller.eventDetails.value!.location),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(controller.eventDetails.value!.description)
                ],
              ),
            )
          ],
        );
      },
    );
  }
}
