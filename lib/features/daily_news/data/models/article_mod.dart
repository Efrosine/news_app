import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';

@JsonSerializable()
class ArticleModel extends ArticleEntity {
  const ArticleModel(
      {int? id,
      String? author,
      String? title,
      String? description,
      String? url,
      String? urlToImage,
      String? publichedAt,
      String? content})
      : super(
            id: id,
            author: author,
            title: title,
            description: description,
            url: url,
            urlToImage: urlToImage,
            publichedAt: publichedAt,
            content: content);

  factory ArticleModel.fromJson(Map<String,dynamic> map){
    return ArticleModel(
        author: map['author'] ?? "",
        title: map['title'] ?? "",
        description: map['description'] ?? "",
        url: map['url'] ?? "",
        urlToImage: map['urlToImage'] ?? "",
        publichedAt: map['publishedAt'] ?? "",
        content: map['content'] ?? '');
  }
}