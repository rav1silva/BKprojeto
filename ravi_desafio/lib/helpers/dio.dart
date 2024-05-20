import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _singleton = DioClient._internal();

  factory DioClient() {
    return _singleton;
  }

  DioClient._internal();

  final Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://192.168.10.6:3000",
    ),
  );
}
