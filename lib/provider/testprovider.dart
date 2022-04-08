import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_app2/model/comment_details.dart';
import 'package:test_app2/model/details.dart';
import 'package:test_app2/model/postdetails.dart';
import 'package:test_app2/service/comehere.dart';

class TestProvider extends ChangeNotifier {
  List<Details> detail = [];
  List<PostDetails> postdetail = [];
  List<CommentDetails> commentdetails = [];
  bool loading = false;
  bool error = false;

  void getData() async {
    Response response = await ComeHere().getDetails('albums');
    if (response.statusCode == 200) {
      for (var d in response.data) {
        detail.add(Details.fromJson(d));
      }
      loading = false;
      error = false;
    } else {
      loading = true;
      error = false;
    }
    notifyListeners();
  }

  void getPosts() async {
    Response response = await ComeHere().getDetails('posts');
    if (response.statusCode == 200) {
      for (var b in response.data) {
        postdetail.add(PostDetails.fromJson(b));
      }
      loading = false;
      error = false;
    } else {
      loading = true;
      error = false;
    }
    notifyListeners();
  }

  void getComments() async {
    Response response = await ComeHere().getDetails('comments');
    if (response.statusCode == 200) {
      for (var a in response.data) {
        commentdetails.add(CommentDetails.fromJson(a));
      }
      loading = false;
      error = false;
    } else {
      loading = true;
      error = false;
    }
    notifyListeners();
  }
}
