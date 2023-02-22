import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_work/core/api/entities.dart';
import 'package:test_work/core/style.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatelessWidget {
   ArticleScreen({Key? key, required this.article}) : super(key: key);
  final Articles article;
  final WebViewController controller = WebViewController();


  DateTime dataConvert() {
    return DateTime.parse(article.publishedAt ?? "01.01.2023");
  }

  @override
  Widget build(BuildContext context) {
    final published = dataConvert();
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              article.urlToImage ?? "",
              fit: BoxFit.fill,
                errorBuilder: (context,object,stacktrace){
                  return SizedBox();
                }
            ),
            const SizedBox(
              height: 16.0,
            ),
            Container(
              decoration: const BoxDecoration(
                  color: Color(0x32464646),
                  borderRadius: AppBorderRadius.defaultBorderRadius),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  children: [
                    Column(
                      children: [
                        Text(
                          "Author : ${article.author ?? "Unknown"}",
                          style: AppTextStyle.contentLarge,
                        ),
                        const SizedBox(
                          height: 16.0,
                        ),
                        Text(
                            "${published.day}:${published.month}:${published.year}"),
                        const SizedBox(
                          height: 16.0,
                        ),
                      ],
                    ),
                    Text(
                      article.title ?? "",
                      style: AppTextStyle.titleLarge,
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Text(
                      article.content?.split("[")[0] ?? "",
                      style: AppTextStyle.contentLarge,
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
