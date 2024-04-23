import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/presentation/bloc/article/remote/remote_article_bloc.dart';
import 'package:news_app/presentation/bloc/article/remote/remote_article_state.dart';
import 'package:news_app/presentation/widgets/article_tile.dart';

class DailyNews extends StatelessWidget {
  const DailyNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: _buildBody(),
    );
  }
}

_buildAppBar(BuildContext context) {
  return AppBar(
    title: const Text(
      "Daily News",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
      ),
    ),
  );
}

_buildBody() {
  return BlocBuilder<RemoteArticlesBloc, RemoteArticlesState>(
    builder: (_, state) {
      if (state is RemoteArticlesLoading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      }
      if (state is RemoteArticleError) {
        return GestureDetector(
          onTap: _buildBody,
          child: const Center(
            child: Icon(Icons.refresh),
          ),
        );
      }
      if (state is RemoteArticleLoaded) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ArticleTile(
              article: state.articles![index],
            );
          },
          itemCount: state.articles!.length,
        );
      }
      return const SizedBox();
    },
  );
}
