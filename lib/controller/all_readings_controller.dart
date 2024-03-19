import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/controller/all_reg_controller.dart';
import 'package:qr_code_reader_app/model/client.dart';
import 'package:qr_code_reader_app/shared/shared_prefs.dart';

class AllReadingsController extends GetxController with StateMixin {
  AllReadingsController();

  ApiClass apiClass = ApiClass();

  SharedPrefs sharedPrefs = SharedPrefs();

  AllRegController allRegController = Get.put(AllRegController());

  RxBool deleting = false.obs;

  final PagingController<int, ClientModel> pagingController =
      PagingController(firstPageKey: 0);

  RxList<ClientModel> allReadings = RxList<ClientModel>([]);

  RxInt readingsCount = 0.obs;

  @override
  Future<void> onInit() async {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey + 1);
    });
    change(null, status: RxStatus.success());
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      String? userId = await sharedPrefs.getUserID();
      final newItems = await apiClass.getAllReadings(10, pageKey, userId!);

      allReadings(
          [...allReadings, ...newItems['readings'] as List<ClientModel>]);

      readingsCount(newItems['count']);

      final isLastPage = allReadings.length == readingsCount.value;
      if (isLastPage) {
        pagingController
            .appendLastPage(newItems['readings'] as List<ClientModel>);
      } else {
        final nextPageKey = pageKey;
        pagingController.appendPage(
            newItems['readings'] as List<ClientModel>, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  Future<void> deleteReading(id) async {
    await apiClass.removeQrCodeReading(id);
    // await allCards.delete(id);
    allRegController.onRefresh();
    change(null, status: RxStatus.success());
  }
}
