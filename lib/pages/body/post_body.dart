import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/pages/error/not_found.dart';
import 'package:hashfi_task2_app/view_model/bloc/post_bloc/post_bloc.dart';

class PostBody extends StatelessWidget {
  final PostBloc myPostbloc;
  const PostBody({super.key, required this.myPostbloc});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      bloc: myPostbloc,
      builder: (context, state) {
        if (state is PostLoading) {
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
        } else if (state is PostLoaded) {
          final postData = state.posts;
          return ListView.builder(
            itemBuilder: (context, index) {
              final postResult = postData[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    title: Text(
                        'Title: ${postResult.title}\nUser Id: ${postResult.userId}'),
                    subtitle: Text(
                      postResult.body,
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                      maxLines: 3,
                    ),
                    leading: CircleAvatar(
                      child: Text('${postResult.id}'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/postDetail',
                        arguments: {
                          'PUserId': postResult.userId,
                          'PId': postResult.id,
                          'PTitle': postResult.title,
                          'PBody': postResult.body
                        },
                      );
                    },
                  ),
                ),
              );
            },
          );
        } else if (state is PostError) {
          return const Center(
            child: Text('Post Error'),
          );
        } else {
          return const NotFoundPage();
        }
      },
    );
  }
}
