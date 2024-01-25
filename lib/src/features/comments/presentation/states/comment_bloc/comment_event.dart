part of 'comment_bloc.dart';

@immutable
sealed class CommentEvent {}

final class LoadComment extends CommentEvent {}
