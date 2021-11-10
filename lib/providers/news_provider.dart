import 'dart:convert' as convert;

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news_app1/models/news_model.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsModel> newslist = [];
  Future<List<NewsModel>> fetchData(String section) async {
    final url =
        'https://api.nytimes.com/svc/topstories/v2/${section.toLowerCase()}.json?api-key=ik6mAcGbd9zUbgXzntFaG1itsIVE8Zwe';
    var uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      List<dynamic> data = convert.jsonDecode(response.body)['results'];
      List<NewsModel> results =
          data.map((item) => NewsModel.fromjson(item)).toList();
      return results;
    } else {
      print('failed');
    }
  }
}
