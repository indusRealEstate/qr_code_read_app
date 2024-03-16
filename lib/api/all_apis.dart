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

  Future<bool> removeQrCodeReading(String uid, String type) async {
    var url = "${baseUrlMobile}remove_qr_code_read.php";

    Response result = await dio.post(url, data: '${uid}type:$type');
    return result.data;
  }

  Future<dynamic> getAllClients(
      int limit, int pageNumber, String filter) async {
    var url = "${baseUrlMobile}get_all_registered_clients.php";

    Response result = await dio.post(url,
        data: jsonEncode(<String, dynamic>{
          'limit': limit,
          'pageNumber': pageNumber,
          'filter': filter
        }));

    List<ClientModel> clientsList = result.data['clients']!
        .map<ClientModel>((req) => ClientModel.fromJson(jsonEncode(req)))
        .toList();

    return {
      "clients": clientsList,
      "count": result.data['count'],
      "total_count": result.data['total_count'],
      "total_count_reg": result.data['total_count_reg'],
      "total_count_unreg": result.data['total_count_unreg'],
    };
  }
}
