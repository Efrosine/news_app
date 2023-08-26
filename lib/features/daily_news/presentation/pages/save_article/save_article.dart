import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/presentation/bloc/local/bloc/local_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';
import 'package:news_app/injection_container.dart';

class SavvedArticle extends StatelessWidget {
  const SavvedArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocalArticleBloc>()..add(LArticleInitEvt()),
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
      ),
    );
  }

  _appBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBacButtonTapped(context),
          child: const Icon(Icons.arrow_back, color: Colors.black),
        ),
      ),
      title:
          const Text('Saved Articles', style: TextStyle(color: Colors.black)),
    );
  }

  _body() {
    return BlocBuilder<LocalArticleBloc, LocalArticleState>(
      builder: (context, state) {
        if (state is LArticleLoadingS) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is LArticleDoneS) {
          print('article done');
          return _articleList(state.article!);
        }
        return Container();
      },
    );
  }


  _articleList(List<ArticleEntity> articles) {
    if (articles.isEmpty) {
      return const Center(
        child: Text('No Saved Articles'),
      );
    }

    return ListView.builder(
      itemCount: articles.length,
      itemBuilder:(context, index) {
        return ArticleWidget(
          article: articles[index],
          isRemovable: true,
          onRemove: (article) => _onRemoveArticle(context, article),
          onArticlePressed: (article) => _onArticlePressed(context, article),
        );
      },
      );
  }
  _onBacButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }
  
  _onRemoveArticle(BuildContext context, ArticleEntity article) {
    BlocProvider.of<LocalArticleBloc>(context).add(LArticleDeleteEvt(article));
  }
  
  _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }
}
