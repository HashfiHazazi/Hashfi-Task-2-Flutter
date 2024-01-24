import 'package:hashfi_task2_app/src/features/albums/domain/models/album_model.dart';

abstract class AlbumRepository {
  Future<List<AlbumModel>> fetchAlbum();
}
