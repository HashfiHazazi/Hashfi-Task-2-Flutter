import 'package:hashfi_task2_app/src/features/posts/domain/models/post_model.dart';

abstract class PostRepository {
  Future<List<PostModel>> fetchPost();
}
