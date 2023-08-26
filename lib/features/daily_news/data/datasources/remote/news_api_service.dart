import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/daily_news/data/models/article_mod.dart';
import 'package:retrofit/retrofit.dart';
part 'news_api_service.g.dart';

@RestApi(baseUrl: newsAPIBaseURL)
abstract class NewsApiService {
  factory NewsApiService(Dio dio) = _NewsApiService;

  @GET('top-headlines')
  Future<HttpResponse<List<ArticleModel>>> getArticles({
    @Query('apiKey') String? apiKey,
    @Query('category') String? category,
    @Query('country') String? country,
  });
}
