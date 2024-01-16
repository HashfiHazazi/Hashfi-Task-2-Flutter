import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/pages/error/not_found.dart';
import 'package:hashfi_task2_app/view_model/bloc/comment_bloc/comment_bloc.dart';

class CommentBody extends StatelessWidget {
  const CommentBody({
    super.key,
    required this.myCommentBloc,
  });

  final CommentBloc myCommentBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentBloc, CommentState>(
      bloc: myCommentBloc,
      builder: (context, state) {
        if (state is CommentLoading) {
          return const Center(
              child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Fetching API...',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  LinearProgressIndicator()
                ],
              ),
            ),
          ));
        } else if (state is CommentLoaded) {
          final commentData = state.comments;
          return ListView.builder(
            itemBuilder: (context, index) {
              final commentResult = commentData[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    title: Text(
                        'Name: ${commentResult.name}\nPost Id: ${commentResult.postId}\nEmail: ${commentResult.email}'),
                    subtitle: Text(
                      commentData[index].body,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                      maxLines: 3,
                    ),
                    leading: CircleAvatar(
                      child: Text('${commentResult.id}'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/commentDetail',
                        arguments: {
                          'CId': commentResult.id,
                          'CName': commentResult.name,
                          'CPostId': commentResult.postId,
                          'CEmail': commentResult.email,
                          'CBody': commentResult.body
                        },
                      );
                    },
                  ),
                ),
              );
            },
            itemCount: commentData.length,
          );
        } else if (state is CommentError) {
          return const Center(
            child: Text('Comment error!'),
          );
        } else {
          return const NotFoundPage();
        }
      },
    );
  }
}
