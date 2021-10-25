import 'model/comment_model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Network
{
  final String url;

  Network(this.url);

  Future<CommentList> fetchData() async
  {
    Response response = await get(Uri.parse(url));
    if(response.statusCode == 200)
      {
        return new CommentList.fromJson(json.decode(response.body));
      }
    else
      {
        throw Exception(response.statusCode);
      }
  }
}