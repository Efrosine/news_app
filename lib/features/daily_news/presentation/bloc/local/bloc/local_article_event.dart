part of 'local_article_bloc.dart';

sealed class LocalArticleEvent extends Equatable {
  final ArticleEntity? article;
  const LocalArticleEvent({this.article});

  @override
  List<Object> get props => [];
}

class LArticleInitEvt extends LocalArticleEvent{}


class LArticleSaveEvt extends LocalArticleEvent{
  const LArticleSaveEvt(ArticleEntity article) : super(article: article);
}

class LArticleDeleteEvt extends LocalArticleEvent{
  const LArticleDeleteEvt(ArticleEntity article) : super(article: article);
}
