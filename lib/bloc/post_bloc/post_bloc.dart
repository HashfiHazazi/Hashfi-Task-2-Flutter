import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/src/features/posts/domain/models/post_model.dart';
import 'package:hashfi_task2_app/src/features/posts/application/services/post_service.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostService postService;
  PostBloc({required this.postService}) : super(PostInitial()) {
    on<LoadPost>((event, emit) async {
      emit(PostLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        final postResult = await postService.fetchPost();
        emit(PostLoaded(postResult));
      } catch (e) {
        emit(PostError());
      }
    });
  }
}
