import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hashfi_task2_app/models/album_model.dart';
import 'package:hashfi_task2_app/view_model/services/album_service.dart';

part 'album_event.dart';
part 'album_state.dart';

class AlbumBloc extends Bloc<AlbumEvent, AlbumState> {
  final AlbumService albumService;
  AlbumBloc({required this.albumService}) : super(AlbumInitial()) {
    on<LoadAlbum>((event, emit) async {
      emit(AlbumLoading());
      await Future.delayed(const Duration(seconds: 3));
      try {
        final albumResult = await albumService.fetchAlbum();
        emit(AlbumLoaded(albumResult));
      } catch (e) {
        emit(AlbumError());
      }
    });
  }
}
