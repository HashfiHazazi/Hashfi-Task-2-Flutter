part of 'album_bloc.dart';

@immutable
sealed class AlbumEvent {}

final class LoadAlbum extends AlbumEvent {}
