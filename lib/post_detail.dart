class PostDetail {
  final String title;
  final String author;
  final String image;
  final String category;
  final String contents;
  final List<Comment> comments;
  final String createdAt;
  final String updatedAt;

  PostDetail({
    required this.title,
    required this.author,
    required this.image,
    required this.category,
    required this.contents,
    required this.comments,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PostDetail.fromJson(Map<String, dynamic> json) {
    var commentsList = json['comments'] as List;
    List<Comment> comments =
        commentsList.map((i) => Comment.fromJson(i)).toList();

    return PostDetail(
      title: json['title'],
      author: json['author'],
      image: json['image'],
      category: json['category'],
      contents: json['contents'],
      comments: comments,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class Comment {
  final String user;
  final String comment;
  final String createdAt;

  Comment({
    required this.user,
    required this.comment,
    required this.createdAt,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      user: json['user'],
      comment: json['comment'],
      createdAt: json['created_at'],
    );
  }
}
