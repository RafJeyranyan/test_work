import 'package:flutter/material.dart';
import 'package:test_work/core/api/entities.dart';

import '../../../core/style.dart';

class ArticleCard extends StatelessWidget {
  final Articles article;

  const ArticleCard({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return OrientationBuilder(
      builder: (context,orientation){
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width:  size.width * 0.35 ,
              height: orientation == Orientation.portrait ? size.height * 0.15 :size.height * 0.4,
              child: article.urlToImage != null
                  ? Image.network(
                article.urlToImage!,
                fit: BoxFit.contain,
              )
                  : const SizedBox(),
            ),
            SizedBox(
              width: size.width * 0.55,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    article.title ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: AppTextStyle.titleSmall,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    article.content ?? "",
                    overflow: TextOverflow.ellipsis,
                    maxLines: 4,
                    style: AppTextStyle.contentSmall,
                  )
                ],
              ),
            )
          ],
        );
      },

    );
  }
}
