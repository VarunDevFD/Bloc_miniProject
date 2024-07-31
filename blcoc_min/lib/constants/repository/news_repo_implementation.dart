
import 'package:blcoc_min/constants/datasources/news_remote_datasrc.dart';
import 'package:blcoc_min/models/article_entity.dart';
import 'package:blcoc_min/services/repository/article_repository.dart';

class NewsRepoImpl extends ArticleRepository {
  NewsRemoteDataSource newsRemoteDataSource = NewsRemoteDataSourceImpl();
  @override
  Future<List<ArticleEntity>> fetchNewsFromDataSource() async {
    final article = await newsRemoteDataSource.fetchArticleFromApi();
    return article;
  }
}