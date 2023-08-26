import 'package:flutter/material.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/home_news.dart';

class AppRoutes {
  static Route onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return _materialRoute(const HomeNews());
      default:
        return _materialRoute(const HomeNews());
    }
  }

  static Route<dynamic> _materialRoute(Widget views) {
    return MaterialPageRoute(builder: (_) => views);
  }
}
