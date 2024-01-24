import 'package:flutter/material.dart';

class CommentDetailPage extends StatelessWidget {
  const CommentDetailPage({super.key, required this.postId, required this.id, required this.name, required this.email, required this.body});

  final int postId;
  final int id;
  final String name;
  final String email;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: const Text(
          'DETAIL FETCH COMMENTS API',
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
                'Post Id: $postId',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Name: $name',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Email: $email',
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Body content: $body',
                style: const TextStyle(fontSize: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
