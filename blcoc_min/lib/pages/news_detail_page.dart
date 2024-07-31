import 'package:blcoc_min/models/article_entity.dart';
import 'package:flutter/material.dart';

class NewsDetailPage extends StatelessWidget {
  final ArticleEntity news;

  const NewsDetailPage({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(news.title.toString()),
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            news.urlToImage != null
                ? Image.network(
                    news.urlToImage!,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )
                : Image.asset('assets/error_image.jpg',
                    height: 250, width: double.infinity, fit: BoxFit.cover),
            const SizedBox(height: 20),
            Text(
              news.title.toString(),
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              news.description.toString(),
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
