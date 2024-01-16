import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/view_model/bloc/album_bloc/album_bloc.dart';

class AlbumBody extends StatelessWidget {
  const AlbumBody({super.key, required this.myAlbumBloc});

  final AlbumBloc myAlbumBloc;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AlbumBloc, AlbumState>(
      bloc: myAlbumBloc,
      builder: (context, state) {
        if (state is AlbumLoading) {
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
            ),
          );
        } else if (state is AlbumLoaded) {
          final albumData = state.albums;
          return ListView.builder(
            itemBuilder: (context, index) {
              final albumResult = albumData[index];
              return Padding(
                padding: const EdgeInsets.all(8),
                child: Card(
                  child: ListTile(
                    title: Text(
                        'Title: ${albumResult.title}\nUser Id: ${albumResult.userId}'),
                    leading: CircleAvatar(
                      child: Text('${albumResult.id}'),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, '/albumDetail', arguments: {
                        'AUserId': albumResult.userId,
                        'AId': albumResult.id,
                        'ATitle': albumResult.title
                      });
                    },
                  ),
                ),
              );
            },
            itemCount: albumData.length,
          );
        } else if (state is AlbumError) {
          return const Center(
            child: Text('Album Error!'),
          );
        } else {
          return const Center(
            child: Text('Nothing'),
          );
        }
      },
    );
  }
}
