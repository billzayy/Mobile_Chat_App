import 'package:software_project_3/src/domain/model/group_model.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

abstract class GroupService {
  Future<ApiResponse<GroupModel>> createGroup(Map<String, dynamic> param);
  Future<ApiResponse<List<GroupModel>>> getAllGroup(int userID);
  Future<ApiResponse<String>> updateFroup(Map<String, dynamic> param);
  Future<ApiResponse<GroupModel>> getGroup(int idGroup);
}
