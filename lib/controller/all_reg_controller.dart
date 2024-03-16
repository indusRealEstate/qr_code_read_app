import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:qr_code_reader_app/api/all_apis.dart';
import 'package:qr_code_reader_app/model/client.dart';
import 'package:qr_code_reader_app/routes/app_routes.dart';

class AllRegController extends GetxController with StateMixin {
  AllRegController();

  ApiClass apiClass = ApiClass();

  RxList<ClientModel> clients = RxList<ClientModel>([]);

  RxInt clientCount = 0.obs;

  RxInt totalClientsCount = 0.obs;
  RxInt totalClientsCountReg = 0.obs;
  RxInt totalClientsCountUnReg = 0.obs;

  RxString filter = 'reg'.obs;
  RxBool filterOn = false.obs;

  late ClientModel selectedReg;

  final PagingController<int, ClientModel> pagingController =
      PagingController(firstPageKey: 0);

  @override
  Future<void> onInit() async {
    super.onInit();

    pagingController.addPageRequestListener((pageKey) {
      fetchPage(pageKey + 1);
    });

    change(null, status: RxStatus.success());
  }

  void onRefresh() {
    change(null, status: RxStatus.loading());
    clients.clear();
    clientCount(0);
    pagingController.refresh();
    change(null, status: RxStatus.success());
  }

  Future<void> fetchPage(int pageKey) async {
    try {
      final newItems = await apiClass.getAllClients(
          10, pageKey, filterOn.value ? filter.value : '');

      clients([...clients, ...newItems['clients']]);

      clientCount(newItems['count']);
      totalClientsCount(newItems['total_count']);
      totalClientsCountReg(newItems['total_count_reg']);
      totalClientsCountUnReg(newItems['total_count_unreg']);

      final isLastPage = clients.length == clientCount.value;
      if (isLastPage) {
        pagingController
            .appendLastPage(newItems['clients'] as List<ClientModel>);
      } else {
        final nextPageKey = pageKey;
        pagingController.appendPage(
            newItems['clients'] as List<ClientModel>, nextPageKey);
      }
    } catch (error) {
      pagingController.error = error;
    }
  }

  void goToDetailsPage(ClientModel item) {
    selectedReg = item;
    Get.toNamed(AppRoutes.regDetails);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pagingController.dispose();
  }
}
