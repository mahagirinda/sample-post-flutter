class Post {
  final int id;
  final String title;
  final String author;
  final String image;
  final String category;
  final String contentPreview;
  final int visitCounts;
  final int commentCounts;
  final String createdAt;
  final String updatedAt;

  Post({
    required this.id,
    required this.title,
    required this.author,
    required this.image,
    required this.category,
    required this.contentPreview,
    required this.visitCounts,
    required this.commentCounts,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      image: json['image'],
      category: json['category'],
      contentPreview: json['content_preview'],
      visitCounts: json['visit_counts'],
      commentCounts: json['comment_counts'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}
