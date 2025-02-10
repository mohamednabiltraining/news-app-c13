import 'package:flutter/material.dart';
import 'package:news_app_c13/data/models/news_model.dart';
import 'package:news_app_c13/ui/widgets/news_item.dart';

class NewsListView extends StatelessWidget {
  final List<NewsArticle> articles;
  const NewsListView({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return NewsItem(article: articles[index]);
      },
      itemCount: articles.length,
    );
  }
}
