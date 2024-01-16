import 'dart:convert';

import 'package:hashfi_task2_app/models/album_model.dart';
import 'package:http/http.dart' as http;

class AlbumService {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future fetchAlbum() async {
    final albumResponse = await http.get(Uri.parse('$baseUrl/albums'));
    final albumBody = albumResponse.body;
    final albumResult = jsonDecode(albumBody);
    List<AlbumModel> albumList =
        List.from(albumResult.map((albums) => AlbumModel.fromJson(albums)));
    return albumList;
  }
}
