import 'dart:convert';


import 'package:hashfi_task2_app/models/comment_model.dart';
import 'package:http/http.dart' as http;

class CommentService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future fetchComment() async {
    final commentResponse = await http.get(Uri.parse('$baseUrl/comments'));
    final commentBody = commentResponse.body;
    final commentResult = jsonDecode(commentBody);
    List<CommentModel> commentList = List.from(
        commentResult.map((comments) => CommentModel.fromJson(comments)));
    return commentList;
  }
}
