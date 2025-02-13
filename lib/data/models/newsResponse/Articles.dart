
import 'package:news_app_c13/data/models/sourceResponse/Source.dart';

/// source : {"id":null,"name":"Gizmodo.com"}
/// author : "James Whitbrook and Gordon Jackson"
/// title : "There’s Even More Updates From the He-Man Movie"
/// description : "Plus, Dave Bautista has found his next sci-fi project."
/// url : "https://gizmodo.com/he-man-masters-of-the-universe-movie-king-randor-queen-marlena-james-purefoy-charlotte-riley-2000562647"
/// urlToImage : "https://gizmodo.com/app/uploads/2025/02/MS-0212-He-Man-King-Randor-Queen-Marlena.jpg"
/// publishedAt : "2025-02-12T14:00:34Z"
/// content : "Parker Posey wants to make a Stab film happen. The Night House adaptation has found its stars. Paul Giamatti could bring paranormal DJ Art Bell to life in a new movie. Plus, what’s coming up on Ghost… [+4504 chars]"

class NewsArticle {
  NewsArticle({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  NewsArticle.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}