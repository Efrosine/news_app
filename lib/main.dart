import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/app_theme.dart';
import 'package:news_app/config/route/route.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/pages/home/home_news.dart';
import 'package:news_app/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependecies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(RArticleGetArticleEvt()),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          home: const HomeNews()),
    );
  }
}
