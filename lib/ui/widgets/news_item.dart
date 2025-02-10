import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/news_model.dart';

class NewsItem extends StatelessWidget {
  final NewsArticle article;
  const NewsItem({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Text(article.title);
  }
}
