import 'package:http/http.dart' as http;
import 'package:infinitelist/models/post_model.dart';
import 'dart:convert';

class ApiHelper {
  static Future<List<Post>> getPosts({int lastId = 0}) async {
    const int _limit = 20;

    final uri = Uri.https(
        'jsonplaceholder.typicode.com', '/posts', <String, String>{
      '_start': lastId.toString(),
      '_limit': _limit.toString()
    });

    final response = await http.get(uri);

    return Post.fromJson(jsonDecode(response.body));
  }
}
