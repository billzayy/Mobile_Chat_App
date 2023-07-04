import 'package:software_project_3/src/domain/model/message_model.dart';
import 'package:software_project_3/src/infrastructure/repositories/dio.dart';

abstract class MessageService {
  Future<ApiResponse<List<MessageModel>>> getMessages(int idGroup);
}
