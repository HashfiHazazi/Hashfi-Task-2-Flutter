import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/src/features/comments/domain/models/comment_model.dart';
import 'package:hashfi_task2_app/src/features/comments/application/services/comment_service.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentService commentService;
  CommentBloc({required this.commentService}) : super(CommentInitial()) {
    on<LoadComment>(
      (event, emit) async {
        emit(CommentLoading());
        await Future.delayed(const Duration(seconds: 3));
        try {
          final commentResult = await commentService.fetchComment();
          emit(CommentLoaded(commentResult));
        } catch (e) {
          emit(CommentError());
        }
      },
    );
  }
}
