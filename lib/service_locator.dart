import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/data/data_sources/remoute_data_source/news_api_service.dart';
import 'package:news_app/data/repositories/article_repository_impl.dart';
import 'package:news_app/domain/repositories/article_repository.dart';
import 'package:news_app/domain/usecases/get_article_use_case.dart';
import 'package:news_app/presentation/bloc/article/remote/remote_article_bloc.dart';

final sl = GetIt.instance;

Future<void> initializationDependencies() async {
  //Dio
  sl.registerSingleton<Dio>(Dio());

  //Dependencies
  sl.registerSingleton<NewsApiService>(NewsApiService(sl()));
  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  //UseCases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  //Bloc
  sl.registerFactory<RemoteArticlesBloc>(() => RemoteArticlesBloc(sl()));
}
