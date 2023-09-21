import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kot/post/res/const_vals.dart';

import '../models/post_list.dart';

class PostAPI {
  static fetchAllPost() async {
    PostList posts = PostList();
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/dev/app/list-my-post?user=64a06251ba1b942c8aeeba9e',
      options: Options(
        method: 'GET',
      ),
    );

    if (response.statusCode == 200) {
      posts = postListFromMap(json.encode(response.data));
      print(posts);
    } else {
      // print(response.statusMessage);
    }
    return posts;
  }

  static addPost(String msg) async {
    var headers = {'Content-Type': 'application/json'};
    var data =
        json.encode({"user": "64a06251ba1b942c8aeeba9e", "message": msg});
    log(data);
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/dev/app/add-post',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      Fluttertoast.showToast(
          msg: "Successfully added",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
      print(json.encode(response.data));
    } else {
      Fluttertoast.showToast(
          msg: "Error occured while adding",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(response.statusMessage);
    }
  }

  static updatePost(Map details) async {
    var headers = {'Content-Type': 'application/json'};
// {
//   "_id": "64c652f8df1d6736c3e2683d",
//   "message": "This is my first post updated"
// }
    var data = json.encode(details);
    var dio = Dio();
    var response = await dio.request(
      '$baseUrl/dev/app/update-post',
      options: Options(
        method: 'PUT',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
      Fluttertoast.showToast(
          msg: "Successfully updated",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.blue,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "Error occured while updating",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      print(response.statusMessage);
    }
  }
}
