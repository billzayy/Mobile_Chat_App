
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class UserRepository implements UserService {
  /// create dio
  final ApiClient apiClient = Get.find();
  @override
  Future<ApiResponse<List<UserModel>>> getUser() async {
    try {
      final response = await apiClient.dio.get(
        '/get-user/',
      );
      if (response.statusCode == 200) {
        /// as List<dynamic> easy to understand
        final data = response.data['data'] as List;
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
  @override
  Future<ApiResponse<UserModel>> loginUser(
      String email, String password) async {
    try {
      final response = await apiClient.dio.get(
        '/login?email=$email&password=$password',
      );
      if (response.statusCode == 200) {
        final data = response.data['data'];
        return ApiResponse<UserModel>.completed(UserModel.fromJson(data));
        // (response.data[0]),
      } else {
        return ApiResponse<UserModel>.error(response.statusCode.toString());
      }
    } on DioError catch (d) {
      return ApiResponse<UserModel>.error(d.message);
    } catch (ex) {
      return ApiResponse<UserModel>.error(ex.toString());
    }
  }

  @override
  Future<ApiResponse<String>> signUser(Map<String, dynamic> param) async {
    try {
      final response = await apiClient.dio.post('/create-user/', data: param);
      if (response.statusCode == 201) {
        final data = response.data['data'];
        return ApiResponse<String>.completed(data);
        // (response.data[0]),
      } else {
        return ApiResponse<String>.error(response.statusCode.toString());
      }
    } on DioError catch (d) {
      return ApiResponse<String>.error(d.message);
    } catch (ex) {
      return ApiResponse<String>.error(ex.toString());
    }
  }
}