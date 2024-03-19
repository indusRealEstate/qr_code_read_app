import 'package:get/get.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/model/event.dart';

class EventController extends GetxController with StateMixin {
  EventController();

  ApiClass apiClass = ApiClass();

  Rxn<EventModel> eventDetails = Rxn<EventModel>();

  @override
  void onInit() async {
    super.onInit();
    await apiClass.getEventDetails().then((value) => eventDetails(value));
    change(null, status: RxStatus.success());
  }
}
