import 'package:dio/dio.dart';
import 'package:moya/core/resources/result.dart';
import 'package:moya/core/utils/authorization.dart';
import 'package:moya/core/utils/my_dio.dart';

class GetMySponsorListApi {
  Future<Result<Iterable>> fetch() async {
    try {
      final response = await myDio.get('/donate/my', options: authorization());
      return Result.success(response.data);
    } on DioException catch (e) {
      return Result.error(e.message ?? '');
    }
  }
}
