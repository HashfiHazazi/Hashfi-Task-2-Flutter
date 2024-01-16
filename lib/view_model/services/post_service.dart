import 'dart:convert';

import 'package:hashfi_task2_app/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future fetchPost() async {
    final postResponse = await http.get(Uri.parse('$baseUrl/posts'));
    final postBody = postResponse.body;
    final postResult = jsonDecode(postBody);
    List<PostModel> postList =
        List.from(postResult.map((posts) => PostModel.fromJson(posts)));
    return postList;
  }
}
