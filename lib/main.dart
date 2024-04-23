import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/config/theme/app_theme.dart';
import 'package:news_app/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/presentation/bloc/article/remote/remote_article_event.dart';
import 'package:news_app/presentation/pages/home/daily_news.dart';
import 'package:news_app/service_locator.dart';

Future<void> main() async {
  await initializationDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticlesBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Daily News',
        debugShowCheckedModeBanner: false,
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
