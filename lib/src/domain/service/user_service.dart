import 'package:software_project_3/src/domain/model/user_model.dart';

abstract class UserService {
  Future<List<UserModel>> getUser();
}
