import 'package:dio/dio.dart';

final Dio myDio = Dio(
  BaseOptions(
    headers: {
      Headers.contentTypeHeader: "application/json; charset=UTF-8",
    },
    baseUrl: "http://localhost:8080/api",
  ),
);
