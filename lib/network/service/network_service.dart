// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
// import 'package:meta/meta.dart';
// import 'package:http_middleware/http_middleware.dart';

// enum Service { login, register, resend, verify }

class ServiceApi {
  static const String baseUrl = "https://aldo.lumira.live/";
  static const String login = baseUrl + "api/user/login";
  static const String register = baseUrl + "api/user";
  static const String resend = baseUrl + "api/user/resend";
  static const String verify = baseUrl + "api/user/verify";
  static const String update_profile = baseUrl + "api/user/edit";
  static const String add_address = baseUrl + "api/address";
  static const String province = baseUrl + "api/province";
  static const String cities = baseUrl + "api/cities/index/";
  static const String distic = baseUrl + "api/district/index/";
  static const String product = baseUrl + "api/product";
  static const String search = baseUrl + "api/product/search/";
}
