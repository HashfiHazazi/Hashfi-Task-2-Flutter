import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/pages/body/album_body.dart';
import 'package:hashfi_task2_app/pages/body/comment_body.dart';
import 'package:hashfi_task2_app/pages/body/post_body.dart';
import 'package:hashfi_task2_app/pages/body/user_body.dart';
import 'package:hashfi_task2_app/view_model/bloc/album_bloc/album_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/comment_bloc/comment_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/post_bloc/post_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/user_bloc/user_bloc.dart';

class BottomNavPage extends StatelessWidget {
  BottomNavPage({super.key});

  List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(icon: Icon(Icons.person), label: 'User'),
    const BottomNavigationBarItem(icon: Icon(Icons.comment), label: 'Comment'),
    const BottomNavigationBarItem(icon: Icon(Icons.image), label: 'Album'),
    const BottomNavigationBarItem(
        icon: Icon(Icons.send_rounded), label: 'Post'),
  ];

  List<Text> appBarTitle = <Text>[
    const Text('FETCH USERS API', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
    const Text('FETCH COMMENTS API', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
    const Text('FETCH ALBUMS API', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
    const Text('FETCH POSTS API', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
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
