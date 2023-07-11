import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/domain/service/message_service.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

class MessageRepository implements MessageService {
  final ApiClient apiClient = Get.find();

  @override
  Future<ApiResponse<List<MessageModel>>> getMessages(int idGroup) async {
    try {
      final response = await apiClient.dio.get(
        '/chat/get-all?idGroup=$idGroup',
      );
      if (response.statusCode == 200) {
        /// as List<dynamic> easy to understand
        final data = response.data['data'] as List;
        final listmessage = data.map((e) => MessageModel.fromJson(e)).toList();
        return ApiResponse<List<MessageModel>>.completed(listmessage);
        // (response.data[0]),
      } else {
        return ApiResponse<List<MessageModel>>.error(response.statusCode.toString());
      }
    } on DioException catch (d) {
      return ApiResponse<List<MessageModel>>.error(d.message);
    } catch (ex) {
      return ApiResponse<List<MessageModel>>.error(ex.toString());
    }
  }
}
