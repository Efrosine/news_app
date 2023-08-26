import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/daily_news/data/datasources/remote/news_api_service.dart';
import 'package:news_app/features/daily_news/data/repositories/article_repo_impl.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initDependecies() async{
  sl
  ..registerSingleton<Dio>(Dio())
  ..registerSingleton<NewsApiService>(NewsApiService(sl()))
  ..registerSingleton<ArticleRepo>(ArticleRepoImpl(sl()))
  ..registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()))
  ..registerFactory<RemoteArticleBloc>(() => RemoteArticleBloc(sl()));
  
}