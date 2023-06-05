import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

abstract class UserService {
  Future<ApiResponse<List<UserModel>>> getUser();
}
