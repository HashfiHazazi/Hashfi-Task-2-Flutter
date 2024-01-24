import 'package:dio/dio.dart';
import 'package:hashfi_task2_app/src/features/comments/data/repositories/comment_repository.dart';
import 'package:hashfi_task2_app/src/features/comments/domain/models/comment_model.dart';

class CommentService implements CommentRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<CommentModel>> fetchComment() async {
    try {
      Dio dio = Dio();
      final commentResponse = await dio.get('$baseUrl/comments');
      final commentResult = commentResponse.data;
      List<CommentModel> commentList = List.from(
          commentResult.map((comments) => CommentModel.fromJson(comments)));
      return commentList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
