import 'package:floor/floor.dart';
import 'package:news_app/features/daily_news/domain/entities/article_ent.dart';

@Entity(tableName: 'article',primaryKeys: ['id'])
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

  factory ArticleModel.fromEntity(ArticleEntity entity){
    return ArticleModel(
      id: entity.id,
      author: entity.author,
      title: entity.title,
      description: entity.description,
      url: entity.url,
      urlToImage: entity.urlToImage,
      publichedAt: entity.publichedAt,
      content: entity.content
    );
  }
}