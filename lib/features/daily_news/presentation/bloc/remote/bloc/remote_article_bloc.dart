import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/core/resorces/data_state.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/usecases/get_article.dart';

part 'remote_article_event.dart';
part 'remote_article_state.dart';

class RemoteArticleBloc extends Bloc<RemoteArticleEvent, RemoteArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  RemoteArticleBloc(this._getArticleUseCase) : super(RArticleLoadingS()) {
    on<RArticleGetArticleEvt>(_getArticle);
  }

  void _getArticle(RArticleGetArticleEvt event, Emitter<RemoteArticleState> emit) async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(RArticleDoneS(dataState.data!));
    } else {
      emit(RArticleErrorS(dataState.error!));
    }
  }
}
