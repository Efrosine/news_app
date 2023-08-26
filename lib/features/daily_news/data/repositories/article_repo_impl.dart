import 'dart:io';

import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resorces/data_state.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';

class ArticleRepoImpl extends ArticleRepo {
  final NewsApiService _newsApiService;

  ArticleRepoImpl(this._newsApiService);
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
      return DataFailed(e);
    }
  }
}
