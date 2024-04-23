import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/domain/entities/article.dart';

abstract class RemoteArticlesState extends Equatable {
  final List<ArticleEntity>? articles;
  final DioException? exception;

  const RemoteArticlesState({
    this.articles,
    this.exception,
  });

  @override
  List<Object?> get props => [articles!, exception!];
}

class RemoteArticlesLoading extends RemoteArticlesState {
  const RemoteArticlesLoading();
}

class RemoteArticleLoaded extends RemoteArticlesState {
  const RemoteArticleLoaded(List<ArticleEntity> article)
      : super(articles: article);
}

class RemoteArticleError extends RemoteArticlesState {
  const RemoteArticleError(DioException exception)
      : super(exception: exception);
}
