import 'package:moya/core/resources/result.dart';
import 'package:moya/di/locator.dart';
import 'package:moya/domain/entities/user.dart';
import 'package:moya/domain/repositories/get_user_repository.dart';

class GetUserUseCase {
  Future<Result<User>> call() async {
    GetUserRepository repository = serviceLocator<GetUserRepository>();
    final result = await repository.fetch();
    return result;
  }
}
