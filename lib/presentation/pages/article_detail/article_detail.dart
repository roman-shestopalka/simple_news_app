import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/link.dart';

class ArticleDetailPage extends StatelessWidget {
  final String articleTitle;
  final String articleDate;
  final String articleDescription;
  final String articleImageUrl;
  final String articleUrl;
  const ArticleDetailPage({
    super.key,
    required this.articleTitle,
    required this.articleDate,
    required this.articleDescription,
    required this.articleImageUrl,
    required this.articleUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                _buildArticleTitleAndDate(),
                _buildArticleImage(),
                _buildArticleDescription(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar(BuildContext context) {
    return AppBar();
  }

  Widget _buildArticleTitleAndDate() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          articleTitle,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 18,
            color: Colors.black,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Row(
          children: [
            const Icon(
              Icons.watch_later_outlined,
              size: 17,
              color: Colors.grey,
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              articleDate,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget _buildArticleImage() {
    if (articleImageUrl.isNotEmpty) {
      return CachedNetworkImage(imageUrl: articleImageUrl);
    }
    return const SizedBox();
  }

  Widget _buildArticleDescription() {
    return Column(
      children: [
        const SizedBox(
          height: 15,
        ),
        Text(
          articleDescription,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Link(
          target: LinkTarget.self,
          uri: Uri.parse(articleUrl),
          builder: (context, followLink) => TextButton(
            onPressed: followLink,
            child: Text(
              articleUrl,
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
