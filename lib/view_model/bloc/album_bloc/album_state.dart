part of 'album_bloc.dart';

@immutable
sealed class AlbumState {}

final class AlbumInitial extends AlbumState {}

final class AlbumLoading extends AlbumState {}

final class AlbumLoaded extends AlbumState {
  final List<AlbumModel> albums;
  AlbumLoaded(this.albums);
}

final class AlbumError extends AlbumState {}
