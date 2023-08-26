import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/presentation/pages/detail_article/detail_article.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/home_news.dart';
import 'package:news_app/features/daily_news/presentation/pages/save_article/save_article.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeNews());
        case '/ArticleDetails':
        return _materialRoute(DetailArticle(
          article: settings.arguments as ArticleEntity,
        ));
      case '/SavedArticles':
        return _materialRoute(SavvedArticle());
      default:
        return _materialRoute(const HomeNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget views) {
    return MaterialPageRoute(builder: (_) => views);
  }
}
