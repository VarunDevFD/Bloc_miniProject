
import 'package:blcoc_min/models/article_entity.dart';

class ArticleModel extends ArticleEntity {
  final String? sourceId;
  final String? sourceName;

  const ArticleModel({
    String? id,
    super.author,
    super.title,
    super.description,
    super.url,
    super.urlToImage,
    super.publishedAt,
    super.content,
    this.sourceId,
    this.sourceName,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) {
    return ArticleModel(
      author: json['author'],
      title: json['title'],
      description: json['description'],
      url: json['url'],
      urlToImage: json['urlToImage'],
      publishedAt: json['publishedAt'],
      content: json['content'],
      sourceId: json['source'] != null ? json['source']['id'] : null,
      sourceName: json['source'] != null ? json['source']['name'] : null,
    );
  }
}