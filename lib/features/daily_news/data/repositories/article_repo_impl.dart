import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resorces/data_state.dart';
import 'package:news_app/features/daily_news/data/datasources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/models/article_mod.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';

class ArticleRepoImpl extends ArticleRepo {
  final NewsApiService _newsApiService;
  final AppDatabase _appDatabase;

  ArticleRepoImpl(this._newsApiService, this._appDatabase);
  @override
  Future<DataState<List<ArticleEntity>>> getArticles() async {
    try {
      final response = await _newsApiService.getArticles(
          apiKey: newsAPIKey, category: categoryQuery, country: countryQuery);
      if (response.response.statusCode == HttpStatus.ok) {
        return DataSuccess(response.data);
      } else {
        return DataFailed(DioException(
            requestOptions: response.response.requestOptions,
            response: response.response,
            error: response.response.statusMessage,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      print(e);
      return DataFailed(e);
    }
  }
  
  @override
  Future<List<ArticleEntity>> getSavedArticles() {
    return _appDatabase.articleDAO.getArticles();
  }
  
  @override
  Future<void> removeArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.deleteArticle(ArticleModel.fromEntity(article));
  }
  
  @override
  Future<void> saveArticle(ArticleEntity article) {
    return _appDatabase.articleDAO.insertArticle(ArticleModel.fromEntity(article));
  }
}
