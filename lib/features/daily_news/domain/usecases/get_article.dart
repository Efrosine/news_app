import 'package:news_app/core/resorces/data_state.dart';
import 'package:news_app/core/usecase/usecase.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/domain/repositories/article_repo.dart';

class GetArticleUseCase implements UseCase<DataState<List<ArticleEntity>>,void>{

  final ArticleRepo _articleRepo;

  GetArticleUseCase(this._articleRepo);
  @override
  Future<DataState<List<ArticleEntity>>> call({Params}) {
    return _articleRepo.getArticles();
  }
  
}