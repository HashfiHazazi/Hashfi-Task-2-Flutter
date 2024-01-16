import 'dart:convert';

import 'package:hashfi_task2_app/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future fetchUser() async {
    final userResponse = await http.get(Uri.parse('$baseUrl/users'));
    final userBody = userResponse.body.toString();
    final userResult = jsonDecode(userBody);
    List<UserModel> userList = [];
    for (Map<String, dynamic> i in userResult) {
      userList.add(UserModel.fromJson(i));
    }
    return userList;
  }
}
