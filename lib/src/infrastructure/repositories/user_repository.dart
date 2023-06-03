import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:software_project_3/src/domain/model/user_model.dart';
import 'package:software_project_3/src/domain/service/user_service.dart';
import 'package:software_project_3/src/infrastructure/dio_clien.dart';

class UserRepository implements UserService {
  @override
  Future<List<UserModel>> getUser() {
    // TODO: implement getUser
    throw UnimplementedError();
  }
  // dioClien dio = dioClien();
  // @override
  // Future<List<UserModel>> getUser(Dio dio) async {
  //   try {
  //     final response = await dio.get(
  //       'http://34.124.130.189:8080/api/get-user',
  //     );
  //     if (response.statusCode == 200) {
  //       List<UserModel> data =
  //           response.data.map((e) => UserModel.fromJson(e)).toList();
  //       return data;
  //     }
  //
  //     throw ServerException();
  //   } catch (e) {
  //     // if (kDebugMode) {
  //     log('getAsync _ $e');
  //     // }
  //     if (e is ServerException) {
  //       rethrow;
  //     } else {
  //       throw NoConnectionException();
  //     }
  //   }
  // }
}

class ServerException implements Exception {}

class DataParsingException implements Exception {}

class NoConnectionException implements Exception {}

class DataFailException implements Exception {}
