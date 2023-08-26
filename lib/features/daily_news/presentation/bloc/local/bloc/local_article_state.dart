part of 'local_article_bloc.dart';

sealed class LocalArticleState extends Equatable {
  final List<ArticleEntity>? article;
  const LocalArticleState({this.article});

  @override
  List<Object> get props => [];
}


final class LocalArticleInitial extends LocalArticleState {}

class LArticleLoadingS extends LocalArticleState {}

class LArticleDoneS extends LocalArticleState {
  const LArticleDoneS(List<ArticleEntity> article) : super(article: article);
}