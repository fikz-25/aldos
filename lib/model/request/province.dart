import 'dart:convert';
import 'package:aldo/network/service/network_service.dart';
import 'package:http/http.dart' as http;

// class Province {
//   // final String status;
//   final Data data;
//   // final String message;

//   Province({this.data});

//   factory Province.fromJson(Map<String, dynamic> json) {
//     return new Province(
//       data: Data.fromJson(json['data']),
//     );
//   }
// }

class Data {
  final String idProvince;
  final String province;

  Data({this.idProvince, this.province});

  factory Data.fromJson(Map<String, dynamic> json) {
    return new Data(
      idProvince: json['id_province'],
      province: json['province'],
    );
  }
}
