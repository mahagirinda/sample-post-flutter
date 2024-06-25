import 'dart:convert';
import 'package:http/http.dart' as http;
import 'post.dart';
import 'post_detail.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8000/api';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts?per_page=10'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['data'];
      return data.map((json) => Post.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<PostDetail> fetchPostDetail(int id) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$id'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body)['data'];
      return PostDetail.fromJson(data);
    } else {
      throw Exception('Failed to load post detail');
    }
  }
}
