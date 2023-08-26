part of 'remote_article_bloc.dart';

sealed class RemoteArticleState extends Equatable {
  final List<ArticleEntity>? article;
  final DioException? error;
  const RemoteArticleState({this.article, this.error});

  @override
  List<Object> get props => [];
}


class RArticleLoadingS extends RemoteArticleState {}

class RArticleDoneS extends RemoteArticleState {
  const RArticleDoneS(List<ArticleEntity> articles) : super(article: articles);
}

class RArticleErrorS extends RemoteArticleState{
  const RArticleErrorS(DioException error):super(error: error);
}

