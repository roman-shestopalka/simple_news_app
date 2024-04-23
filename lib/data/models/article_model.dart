import 'package:news_app/domain/entities/article.dart';

class ArticleModel extends ArticleEntity {
  const ArticleModel({
    required super.id,
    required super.name,
    required super.author,
    required super.title,
    required super.description,
    required super.url,
    required super.urlToImage,
    required super.publishedAt,
    required super.content,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> map) {
    return ArticleModel(
      id: map["id"] ?? "",
      name: map["name"] ?? "",
      author: map["author"] ?? "",
      title: map["title"] ?? "",
      description: map["description"] ?? "",
      url: map["url"] ?? "",
      urlToImage: map["urlToImage"] ?? "",
      publishedAt: map["publishedAt"] ?? "",
      content: map["content"] ?? "",
    );
  }
}
