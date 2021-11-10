import 'package:flutter/material.dart';

class NewsModel {
  final String title;
  final String description;
  final String date;
  final String image;
  NewsModel({
    @required this.title,
    @required this.description,
    @required this.date,
    @required this.image,
  });
  factory NewsModel.fromjson(Map<String, dynamic> item) {
    return NewsModel(
      title: item['title'] as String,
      description: item['abstract'] as String,
      date: item['published_date'] as String,
      image: item['multimedia'][3]['url'] as String,
    );
  }
}
