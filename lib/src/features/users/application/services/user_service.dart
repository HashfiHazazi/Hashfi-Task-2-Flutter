import 'package:dio/dio.dart';
import 'package:hashfi_task2_app/src/features/users/data/repositories/user_repository.dart';
import 'package:hashfi_task2_app/src/features/users/domain/models/user_model.dart';

class UserService implements UserRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<UserModel>> fetchUser() async {
    try {
      Dio dio = Dio();
      final userResponse = await dio.get('$baseUrl/users');
      final userResult = userResponse.data;
      List<UserModel> userList = [];
      for (Map<String, dynamic> i in userResult) {
        userList.add(UserModel.fromJson(i));
      }
      return userList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
