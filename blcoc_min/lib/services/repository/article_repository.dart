import 'package:blcoc_min/models/article_entity.dart';

abstract class ArticleRepository {
  Future<List<ArticleEntity>> fetchNewsFromDataSource();
}