import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:task_tgo/models/httpresponse.dart';
import 'package:task_tgo/models/post.dart';


class APIHelper {
  static Future<HTTPResponse<List<Post>>> getPosts(
      {int page = 1}) async {
    try {
      var response = await get(
        Uri.parse('http://104.248.120.14:80/workouts?page=$page'),
      );
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        List<Post> posts = [];

        body.forEach((e) {
          Post post = Post.fromJson(e);
          posts.add(post);
        });

        return HTTPResponse<List<Post>>(
          true,
          posts,
          message: 'Request Successful',
          statusCode: response.statusCode,
        );
      } else {
        return HTTPResponse<List<Post>>(
          false,
          [],
          message:
              'Invalid data received from the server! Please try again in a moment.',
          statusCode: response.statusCode,
        );
      }
    } on SocketException {
      print('SOCKET EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        [],
        statusCode: 500,
        message: 'Unable to reach the internet! Please try again in a moment.',
      );
    } on FormatException {
      print('JSON FORMAT EXCEPTION OCCURRED');
      return HTTPResponse<List<Post>>(
        false,
        [],
        statusCode: 400,
        message:
            'Invalid data received from the server! Please try again in a moment.',
      );
    } catch (e) {
      return HTTPResponse<List<Post>>(
        false,
        [],
        statusCode: 404,
        message: 'Something went wrong! Please try again in a moment!',
      );
    }
  }
}
