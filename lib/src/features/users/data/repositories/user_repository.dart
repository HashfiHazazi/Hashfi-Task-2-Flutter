import 'package:hashfi_task2_app/src/features/users/domain/models/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> fetchUser();
}
