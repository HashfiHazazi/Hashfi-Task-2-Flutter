import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/src/features/albums/presentation/states/album_bloc/album_bloc.dart';
import 'package:hashfi_task2_app/src/features/albums/presentation/widgets/album_body.dart';
import 'package:hashfi_task2_app/src/features/comments/presentation/states/comment_bloc/comment_bloc.dart';
import 'package:hashfi_task2_app/src/features/comments/presentation/widgets/comment_body.dart';
import 'package:hashfi_task2_app/src/features/home/presentation/states/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:hashfi_task2_app/src/features/posts/presentation/states/post_bloc/post_bloc.dart';
import 'package:hashfi_task2_app/src/features/posts/presentation/widgets/post_body.dart';
import 'package:hashfi_task2_app/src/features/users/presentation/states/user_bloc/user_bloc.dart';
import 'package:hashfi_task2_app/src/features/users/presentation/widgets/user_body.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

// ignore: must_be_immutable
class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
    const BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comment'),
    const BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Album'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.send_rounded), label: 'Post'),
  ];

  List<GradientText> appBarTitle = [
    GradientText(
      'FETCH USERS API',
      colors: const [
        Color.fromARGB(255, 255, 221, 0),
        Color.fromARGB(255, 3, 220, 244)
      ],
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    GradientText(
      'FETCH COMMENTS API',
      colors: const [
        Color.fromARGB(255, 255, 221, 0),
        Color.fromARGB(255, 3, 220, 244)
      ],
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    GradientText(
      'FETCH ALBUMS API',
      colors: const [
        Color.fromARGB(255, 255, 221, 0),
        Color.fromARGB(255, 3, 220, 244)
      ],
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
    GradientText(
      'FETCH POSTS API',
      colors: const [
        Color.fromARGB(255, 255, 221, 0),
        Color.fromARGB(255, 3, 220, 244)
      ],
      style: const TextStyle(fontWeight: FontWeight.w600),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    BottomNavBloc myNavBloc = context.read<BottomNavBloc>();
    UserBloc myUserBloc = BlocProvider.of<UserBloc>(context);
    AlbumBloc myAlbumBloc = BlocProvider.of<AlbumBloc>(context);
    CommentBloc myCommentBloc = BlocProvider.of<CommentBloc>(context);
    PostBloc myPostBloc = BlocProvider.of<PostBloc>(context);

    List<Widget> bottomNavBody = <Widget>[
      UserBody(myUserBloc: myUserBloc),
      CommentBody(myCommentBloc: myCommentBloc),
      AlbumBody(myAlbumBloc: myAlbumBloc),
      PostBody(myPostbloc: myPostBloc)
    ];

    return BlocBuilder<BottomNavBloc, BottomNavState>(
      bloc: myNavBloc,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            title: appBarTitle.elementAt(state.tabIndex),
            leading: const Icon(null),
            centerTitle: true,
          ),
          body: bottomNavBody.elementAt(state.tabIndex),
          bottomNavigationBar: BottomNavigationBar(
            items: navItems,
            currentIndex: state.tabIndex,
            elevation: 0,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              myNavBloc.add(TabChange(tabIndex: index));
            },
          ),
        );
      },
    );
  }
}
