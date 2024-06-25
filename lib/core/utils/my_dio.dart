import 'package:dio/dio.dart';
import 'package:moya/core/resources/base_url.dart';

final Dio myDio = Dio(
  BaseOptions(
    headers: {
      Headers.contentTypeHeader: "application/json; charset=UTF-8",
    },
    baseUrl: baseUrl,
  ),
);
