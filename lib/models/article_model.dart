import 'package:flutter/foundation.dart';

class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;

  ArticleModel({
    @required this.title,
    @required this.description,
    @required this.author,
    @required this.url,
    @required this.urlToImage,
  });
}
