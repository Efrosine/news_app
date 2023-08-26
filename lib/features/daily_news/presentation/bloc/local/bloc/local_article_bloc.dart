import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/usecases/local_article.dart';

part 'local_article_event.dart';
part 'local_article_state.dart';

class LocalArticleBloc extends Bloc<LocalArticleEvent, LocalArticleState> {
  final GetSavedArticleUseCase _getSavedArticleUseCase;
  final SaveArticleUseCase _saveArticleUseCase;
  final RemoveArticleUseCase _removeArticleUseCase;

  LocalArticleBloc(
    this._getSavedArticleUseCase,
    this._saveArticleUseCase,
    this._removeArticleUseCase,
  ) : super(LocalArticleInitial()) {
    on<LArticleInitEvt>(_iniEvt);
    on<LArticleDeleteEvt>(_removeEvt);
    on<LArticleSaveEvt>(_saveEvt);
  }

  FutureOr<void> _iniEvt(
      LArticleInitEvt event, Emitter<LocalArticleState> emit) async {
    emit(LArticleLoadingS());
    final article = await _getSavedArticleUseCase();
    emit(LArticleDoneS(article));
  }

  FutureOr<void> _removeEvt(
      LArticleDeleteEvt event, Emitter<LocalArticleState> emit) async {
    emit(LArticleLoadingS());
    await _removeArticleUseCase(params: event.article);
    final article = await _getSavedArticleUseCase();
    emit(LArticleDoneS(article));
  }

  FutureOr<void> _saveEvt(
      LArticleSaveEvt event, Emitter<LocalArticleState> emit) async {
  emit(LArticleLoadingS());
    await _saveArticleUseCase(params: event.article);
    final article = await _getSavedArticleUseCase();
    emit(LArticleDoneS(article));
  }
}
