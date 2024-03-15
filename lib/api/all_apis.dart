import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:qr_code_reader_app/model/client.dart';

class ApiClass {
  static const baseUrlMobile = 'https://indusre.ae/reg-form-jaipur-api/';

  final dio = Dio();

  Future<bool> readQrCode(String uid, String type) async {
    var url = "${baseUrlMobile}qr_code_read.php";

    Response result = await dio.post(url, data: '${uid}type:$type');
    return result.data;
  }

  Future<List<ClientModel>> getAllClients(
      int limit, int pageNumber, String search) async {
    var url = "${baseUrlMobile}get_all_registered_clients.php";

    Response result = await dio.post(url,
        data: jsonEncode(<String, dynamic>{
          'limit': limit,
          'pageNumber': pageNumber,
          'search': search
        }));

    List<ClientModel> paymentList = result.data!
        .map<ClientModel>((req) => ClientModel.fromJson(jsonEncode(req)))
        .toList();

    return paymentList;
  }
}
