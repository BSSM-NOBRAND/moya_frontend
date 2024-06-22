import 'package:dio/dio.dart';
import 'package:moya/core/utils/pref_util.dart';

Options authorization({Options? options}) {
  options ??= Options();

  if (options.headers == null) {
    options.headers = {};
    options.headers?.addAll({
      "Authorization": 'Bearer ${PrefUtil.getString("accessToken")}',
    });
  }

  return options;
}
