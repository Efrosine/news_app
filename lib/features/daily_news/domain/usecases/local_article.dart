import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';

class GetSavedArticleUseCase implements UseCase<List<ArticleEntity>, void> {
  final ArticleRepo _articleRepo;

  GetSavedArticleUseCase(this._articleRepo);
  @override
  Future<List<ArticleEntity>> call({void params}) {
    return _articleRepo.getSavedArticles();
  }
}

class SaveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepo _articleRepo;

  SaveArticleUseCase(this._articleRepo);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepo.saveArticle(params!);
  }
}

class RemoveArticleUseCase implements UseCase<void, ArticleEntity> {
  final ArticleRepo _articleRepo;

  RemoveArticleUseCase(this._articleRepo);
  @override
  Future<void> call({ArticleEntity? params}) {
    return _articleRepo.removeArticle(params!);
  }
}
