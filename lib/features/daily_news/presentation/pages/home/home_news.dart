import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/presentation/bloc/remote/bloc/remote_article_bloc.dart';
import 'package:news_app/features/daily_news/presentation/widgets/article_tile.dart';

class HomeNews extends StatelessWidget {
  const HomeNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: _body(),
    );
  }

  _appBar(BuildContext context) {
    return AppBar(
      title: const Text(
        'Daily News',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      actions: [
        GestureDetector(
            onTap: () => _onShowSavedArticleViewTapped(context),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Icon(Icons.bookmark, color: Colors.black),
            ))
      ],
    );
  }

  _body() {
    return BlocBuilder<RemoteArticleBloc, RemoteArticleState>(
      builder: (_, state) {
        switch (state.runtimeType) {
          case RArticleLoadingS:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RArticleErrorS:
            return const Center(
              child: Icon(Icons.error),
            );
          case RArticleDoneS:
            return ListView.builder(
              itemBuilder: (context, index) {
                return ArticleWidget(
                  article: state.article![index],
                  onArticlePressed: (article) => _onArticlePressed(context, article),
                );
              },
              itemCount: state.article!.length,
            );
          default:
            return const Placeholder();
        }
      },
    );
  }

   void _onArticlePressed(BuildContext context, ArticleEntity article) {
    Navigator.pushNamed(context, '/ArticleDetails', arguments: article);
  }

  _onShowSavedArticleViewTapped(BuildContext context) {
    Navigator.pushNamed(context, '/SavedArticles');
  }
}
