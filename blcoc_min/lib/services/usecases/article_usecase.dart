import 'package:blcoc_min/constants/repository/news_repo_implementation.dart';
import 'package:blcoc_min/models/article_entity.dart';
import 'package:blcoc_min/services/repository/article_repository.dart';

class ArticleUseCases {
  ArticleRepository articleRepository = NewsRepoImpl();
  Future<List<ArticleEntity>> fetchNewsFromDataSource() async {
    final articles = articleRepository.fetchNewsFromDataSource();
    return articles;
  }
}