import 'package:news_app/core/resorces/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';

abstract class ArticleRepo {
  Future<DataState<List<ArticleEntity>>> getArticles();
}