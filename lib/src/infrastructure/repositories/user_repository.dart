import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class UserRepository implements UserService {
  /// khởi tạo dio
  final ApiClient apiClient = Get.find();
  @override
  Future<ApiResponse<List<UserModel>>> getUser() async {
    try {
      final response = await apiClient.dio.get(
        '/get-user/',
      );
      if (response.statusCode == 200) {
        /// as List<dynamic> easy to understand
        final List<dynamic> data = response.data['data'];
        final users = data.map((e) => UserModel.fromJson(e)).toList();
        return ApiResponse<List<UserModel>>.completed(users);
        // (response.data[0]),
      } else {
        return ApiResponse<List<UserModel>>.error(
            response.statusCode.toString());
      }
    } on DioError catch (d) {
      return ApiResponse<List<UserModel>>.error(d.message);
    } catch (ex) {
      return ApiResponse<List<UserModel>>.error(ex.toString());
    }
  }
}