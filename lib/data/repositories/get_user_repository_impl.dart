import 'package:moya/core/resources/result.dart';
import 'package:moya/data/data_sources/get_user_api.dart';
import 'package:moya/data/models/user_model.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/user.dart';
import 'package:moya/domain/repositories/get_user_repository.dart';

class GetUserRepositoryImpl implements GetUserRepository {
  @override
  Future<Result<User>> fetch() async {
    GetUserApi api = serviceLocator<GetUserApi>();
    final result = await api.fetch();
    return result.when(
      success: (json) => Result.success(
        UserModel.fromJson(json),
      ),
      error: (message) => Result.error(message),
    );
  }
}
