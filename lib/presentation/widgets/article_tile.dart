import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/domain/entities/article.dart';
import 'package:news_app/presentation/pages/article_detail/article_detail.dart';

class ArticleTile extends StatelessWidget {
  final ArticleEntity? article;

  const ArticleTile({
    super.key,
    this.article,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => ArticleDetailPage(
              articleTitle: "${article!.title}",
              articleDate: "${article!.publishedAt}",
              articleDescription: "${article!.description}",
              articleImageUrl: "${article!.urlToImage}",
              articleUrl: "${article!.url}",
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsetsDirectional.only(
          start: 14,
          end: 14,
          top: 7,
          bottom: 7,
        ),
        height: MediaQuery.of(context).size.width / 2.2,
        child: Row(
          children: [
            _buildImage(context),
            _buildTitleAndDesctioption(),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    if (article!.urlToImage!.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: article!.urlToImage!,
        imageBuilder: (context, imageProvider) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: double.maxFinite,
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        progressIndicatorBuilder: (context, url, progress) => Padding(
          padding: const EdgeInsetsDirectional.only(end: 14),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Container(
              width: MediaQuery.of(context).size.width / 2.7,
              height: double.maxFinite,
              decoration: const BoxDecoration(color: Colors.black),
              child: const CupertinoActivityIndicator(),
            ),
          ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 14),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          width: MediaQuery.of(context).size.width / 2.7,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: const Icon(Icons.image_not_supported_outlined),
        ),
      ),
    );
  }

  Widget _buildTitleAndDesctioption() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              article!.title ?? "",
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 18,
                color: Colors.black,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  article!.description ?? "",
                  maxLines: 2,
                ),
              ),
            ),
            Row(
              children: [
                const Icon(
                  Icons.timeline_outlined,
                  size: 16,
                ),
                const SizedBox(
                  width: 4,
                ),
                Text(
                  article!.publishedAt!,
                  style: const TextStyle(fontSize: 12),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
