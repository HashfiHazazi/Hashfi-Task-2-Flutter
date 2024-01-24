import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({super.key, required this.userId, required this.id, required this.title});
  final int userId;
  final int id;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'DETAIL FETCH ALBUMS API',
          style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    child: Text(
                      '$id',
                      style: const TextStyle(
                          fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'User Id: $userId',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'User Id: $title',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
