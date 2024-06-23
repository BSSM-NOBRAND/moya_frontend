import 'package:moya/core/resources/result.dart';
import 'package:moya/domain/entities/user.dart';

abstract class GetUserRepository {
  Future<Result<User>> fetch();
}
