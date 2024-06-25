import 'package:flutter/material.dart';
import 'api_service.dart';
import 'post_detail.dart';

class PostDetailPage extends StatelessWidget {
  final int id;

  PostDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Detail'),
      ),
      body: FutureBuilder<PostDetail>(
        future: ApiService().fetchPostDetail(id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Failed to load post detail'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No post detail available'));
          } else {
            final post = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(post.image),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(post.title,
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                        SizedBox(height: 8),
                        Text('By ${post.author}',
                            style: TextStyle(
                                fontSize: 16, fontStyle: FontStyle.italic)),
                        SizedBox(height: 8),
                        Text(post.contents),
                        SizedBox(height: 16),
                        Text('Comments',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        for (var comment in post.comments)
                          ListTile(
                            title: Text(comment.user),
                            subtitle: Text(comment.comment),
                            trailing: Text(comment.createdAt),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
