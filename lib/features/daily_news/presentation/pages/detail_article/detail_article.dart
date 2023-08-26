import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';
import 'package:news_app/features/daily_news/presentation/bloc/local/bloc/local_article_bloc.dart';
import 'package:news_app/injection_container.dart';

class DetailArticle extends StatelessWidget {
    final ArticleEntity? article;
  const DetailArticle({super.key, this.article});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<LocalArticleBloc>(),
      child: Scaffold(
        appBar: _appBar(),
        body: _body(),
        floatingActionButton: _fab(),
      ),
    );
  }
  
  _appBar() {
    return AppBar(
      leading: Builder(
        builder: (context) => GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => _onBacButtonTapped(context),
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
  
  _body() {
    return SingleChildScrollView(
      child: Column(children: [
        _buildArticleTitleAndDate(),
        _buildArticleImage(),
        _buildArticleDescription(),
      ]),
    );
  }
  
  _fab() {
    return Builder(
      builder: (context) => FloatingActionButton(
        onPressed: () => _onFloatActionButtonPressed(context),
        child: const Icon(Icons.bookmarks, color: Colors.white),
      ),
    );
  }
  
  _onBacButtonTapped(BuildContext context) {
    Navigator.pop(context);
  }

  _onFloatActionButtonPressed(BuildContext context) {
    BlocProvider.of<LocalArticleBloc>(context).add(LArticleSaveEvt(article!));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Article saved successfully.'),
      )
    );
  }
  
  _buildArticleTitleAndDate() {
     return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            article!.title ?? 'title is null',
            style: const TextStyle(
                fontFamily: 'Butler',
                fontSize: 20,
                fontWeight: FontWeight.w900),
          ),
          const SizedBox(
            height: 14,
          ),
          Row(
            children: [
              const Icon(
                Icons.timeline,
                size: 16,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                article!.publichedAt ?? 'Date is Null',
                style: const TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
  
  _buildArticleImage() {
      return Container(
      width: double.maxFinite,
      height: 250,
      margin: const EdgeInsets.only(top: 14),
      child: Image.network(article!.urlToImage!, fit: BoxFit.cover),
    );
  }
  
  _buildArticleDescription() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 18),
      child: Text(
        '${article!.description ?? 'desc null'} \n\n${article!.content ?? 'content null'}',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
  
}