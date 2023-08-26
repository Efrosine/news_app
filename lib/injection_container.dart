import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/datasources/local/app_database.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repo_impl.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/domain/usecases/local_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/local/bloc/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependecies() async{
  final db = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

  sl
  ..registerSingleton<AppDatabase>(db)
  ..registerSingleton<Dio>(Dio())
  ..registerSingleton<NewsApiService>(NewsApiService(sl()))
  ..registerSingleton<ArticleRepo>(ArticleRepoImpl(sl(),sl()))

  ..registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()))
  ..registerSingleton<GetSavedArticleUseCase>(GetSavedArticleUseCase(sl()))
  ..registerSingleton<SaveArticleUseCase>(SaveArticleUseCase(sl()))
  ..registerSingleton<RemoveArticleUseCase>(RemoveArticleUseCase(sl()))

  ..registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()))
  ..registerFactory<LocalArticleBloc>(() => LocalArticleBloc(sl(),sl(),sl()));
  
}