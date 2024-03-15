import 'package:dio/dio.dart';

class ApiClass {
  static const baseUrlMobile = 'https://indusre.ae/reg-form-jaipur-api/';

  final dio = Dio();

  Future<bool> readQrCode(String uid, String type) async {
    var url = "${baseUrlMobile}qr_code_read.php";

    Response result = await dio.post(url, data: '${uid}type:$type');
    return result.data;
  }
}
