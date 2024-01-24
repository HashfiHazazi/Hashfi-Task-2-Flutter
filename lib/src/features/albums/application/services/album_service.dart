import 'package:dio/dio.dart';
import 'package:hashfi_task2_app/src/features/albums/data/repositories/album_repostitory.dart';
import 'package:hashfi_task2_app/src/features/albums/domain/models/album_model.dart';

class AlbumService implements AlbumRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  @override
  Future<List<AlbumModel>> fetchAlbum() async {
    try {
      final dio = Dio();
      final albumResponse = await dio.get('$baseUrl/albums');
      final albumResult = albumResponse.data;
      List<AlbumModel> albumList =
          List.from(albumResult.map((albums) => AlbumModel.fromJson(albums)));
      return albumList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
