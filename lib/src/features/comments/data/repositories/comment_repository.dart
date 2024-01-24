import 'package:hashfi_task2_app/src/features/comments/domain/models/comment_model.dart';

abstract class CommentRepository {
  Future<List<CommentModel>> fetchComment();
}
