import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:news_app2/layout/news/cubit/cubit.dart';

class newsItem extends StatelessWidget {
  newsItem({required this.index, required this.article});
  int index;
  Map<dynamic, dynamic> article;
  @override
  Widget build(BuildContext context) {
    var cubit = newsCubit.get(context);
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(children: [
        ConditionalBuilder(
          condition: article['articles'][index]['urlToImage'] == null,
          builder: (context) {
            return Container(
              height: MediaQuery.of(context).size.height * .275,
              width: double.infinity,
            );
          },
          fallback: (context) {
         return   Image.network(
              '${article['articles'][index]['urlToImage']}',
              height: MediaQuery.of(context).size.height * .275,
              width: double.infinity,
              fit: BoxFit.cover,
            );
          },
        ),
        SizedBox(
          height: 2,
        ),
        Row(
          children: [
            Text(
              '${article['articles'][index]['author']}' ,
              style: const TextStyle(color: Colors.grey),
            ),
          ],
        ),
        SizedBox(
          height: 2,
        ),
        Text('${article['articles'][index]['title']}' ,
            style: TextStyle(color: Colors.grey)),
        SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('${article['articles'][index]['publishedAt']}' ,
                style: TextStyle(color: Colors.grey)),
          ],
        ),
      ]),
    );
  }
}
