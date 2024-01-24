import 'package:dio/dio.dart';
import 'package:hashfi_task2_app/src/features/posts/data/repositories/post_repository.dart';
import 'package:hashfi_task2_app/src/features/posts/domain/models/post_model.dart';

class PostService implements PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<PostModel>> fetchPost() async {
    try {
      Dio dio = Dio();
      final postResponse = await dio.get('$baseUrl/posts');
      final postResult = postResponse.data;
      List<PostModel> postList =
          List.from(postResult.map((posts) => PostModel.fromJson(posts)));
      return postList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
