import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/domain/service/group_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class GroupRepository implements GroupService {
  final ApiClient apiClient = Get.find();
  @override
  Future<ApiResponse<String>> createGroup(Map<String, dynamic> param) async {
    try {
      final response = await apiClient.dio.post('/group/create-group', data: param);
      if (response.statusCode == 201) {
        final data = response.data['data'];
        return ApiResponse<String>.completed(data);
        // (response.data[0]),
      } else {
        return ApiResponse<String>.error(response.statusCode.toString());
      }
    } on DioException catch (d) {
      return ApiResponse<String>.error(d.message);
    } catch (ex) {
      return ApiResponse<String>.error(ex.toString());
    }
  }

  @override
  Future<ApiResponse<List<GroupModel>>> getGroup(int userID) async {
    try {
      final response = await apiClient.dio.get(
        '/group/get-all?id=$userID',
      );
      if (response.statusCode == 200) {
        /// as List<dynamic> easy to understand
        final data = response.data['data'] as List;
        final listGroup = data.map((e) => GroupModel.fromJson(e)).toList();
        return ApiResponse<List<GroupModel>>.completed(listGroup);
        // (response.data[0]),
      } else {
        return ApiResponse<List<GroupModel>>.error(response.statusCode.toString());
      }
    } on DioException catch (d) {
      return ApiResponse<List<GroupModel>>.error(d.message);
    } catch (ex) {
      return ApiResponse<List<GroupModel>>.error(ex.toString());
    }
  }
}
