import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/pages/bottom_nav_page.dart';
import 'package:hashfi_task2_app/pages/details/album_detail_page.dart';
import 'package:hashfi_task2_app/pages/details/comment_detail_page.dart';
import 'package:hashfi_task2_app/pages/details/post_detail_page.dart';
import 'package:hashfi_task2_app/pages/error/not_found.dart';
import 'package:hashfi_task2_app/pages/details/user_detail_page.dart';
import 'package:hashfi_task2_app/view_model/bloc/album_bloc/album_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/bottom_nav_bloc/bottom_nav_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/comment_bloc/comment_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/post_bloc/post_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/user_bloc/user_bloc.dart';
import 'package:hashfi_task2_app/view_model/services/album_service.dart';
import 'package:hashfi_task2_app/view_model/services/comment_service.dart';
import 'package:hashfi_task2_app/view_model/services/post_service.dart';
import 'package:hashfi_task2_app/view_model/services/user_service.dart';

class MyRouter {
  final UserBloc myUserBloc = UserBloc(userService: UserService())
    ..add(LoadUser());

  final AlbumBloc myAlbumBloc = AlbumBloc(albumService: AlbumService())
    ..add(LoadAlbum());

  final CommentBloc myCommentBloc =
      CommentBloc(commentService: CommentService())..add(LoadComment());

  final PostBloc myPostBloc = PostBloc(postService: PostService())
    ..add(LoadPost());

  final BottomNavBloc myBottomNavBloc = BottomNavBloc();

  Route onRoute(RouteSettings routePages) {
    switch (routePages.name) {
      case '/bottomNav':
        return MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: myUserBloc),
              BlocProvider.value(value: myAlbumBloc),
              BlocProvider.value(value: myCommentBloc),
              BlocProvider.value(value: myBottomNavBloc),
              BlocProvider.value(value: myPostBloc)
            ],
            child: BottomNavPage(),
          ),
        );
      case '/userDetail':
        final args = routePages.arguments as Map<String, dynamic>;
        final uId = args['id'] as int;
        final uName = args['name'] as String;
        final uUsername = args['username'] as String;
        final uEmail = args['email'] as String;
        final uStreet = args['street'] as String;
        final uSuite = args['suite'] as String;
        final uCity = args['city'] as String;
        final uZipcode = args['zipcode'] as String;
        final uLat = args['lat'] as String;
        final uLng = args['lng'] as String;
        final uPhone = args['phone'] as String;
        final uWebsite = args['website'] as String;
        final uCompanyName = args['companyName'] as String;
        final uCatchphrase = args['catchphrase'] as String;
        final uBs = args['bs'] as String;
        return MaterialPageRoute(
          builder: (context) => UserDetailPage(
              id: uId,
              name: uName,
              username: uUsername,
              email: uEmail,
              street: uStreet,
              suite: uSuite,
              city: uCity,
              zipcode: uZipcode,
              lat: uLat,
              lng: uLng,
              phone: uPhone,
              website: uWebsite,
              companyName: uCompanyName,
              catchPhrase: uCatchphrase,
              bs: uBs),
        );
      case '/commentDetail':
        final args = routePages.arguments as Map<String, dynamic>;
        final cId = args['CId'] as int;
        final cPostId = args['CPostId'] as int;
        final cName = args['CName'] as String;
        final cEmail = args['CEmail'] as String;
        final cBody = args['CBody'] as String;
        return MaterialPageRoute(
          builder: (context) => CommentDetailPage(
              postId: cPostId,
              id: cId,
              name: cName,
              email: cEmail,
              body: cBody),
        );
      case '/albumDetail':
        final args = routePages.arguments as Map<String, dynamic>;
        final aUserId = args['AUserId'] as int;
        final aId = args['AId'] as int;
        final aTitle = args['ATitle'] as String;
        return MaterialPageRoute(
          builder: (context) =>
              AlbumDetailPage(userId: aUserId, id: aId, title: aTitle),
        );
      case '/postDetail':
        final args = routePages.arguments as Map<String, dynamic>;
        final pUserId = args['PUserId'] as int;
        final pId = args['PId'] as int;
        final pTitle = args['PTitle'] as String;
        final pBody = args['PBody'] as String;
        return MaterialPageRoute(
          builder: (context) => PostDetailPage(
              userId: pUserId, id: pId, title: pTitle, body: pBody),
        );
      default:
        return MaterialPageRoute(builder: (context) => const NotFoundPage());
    }
  }
}
