import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

abstract class UserService {
  Future<ApiResponse<List<UserModel>>> getUser();
  Future<ApiResponse<UserModel>> loginUser(String email, String password);
  Future<ApiResponse<String>> signUser(Map<String, dynamic> param);
  Future<ApiResponse<String>> updateUser(Map<String, dynamic> param);
  Future<ApiResponse<UserModel>> search(String name);
}
