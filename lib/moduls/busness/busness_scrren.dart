import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/news/cubit/cubit.dart';
import 'package:news_app2/layout/news/cubit/states.dart';
import 'package:news_app2/shared/component/newsItem.dart';

class busness_scrren extends StatelessWidget {
  const busness_scrren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = newsCubit.get(context);

        return ConditionalBuilder(
          condition: cubit.business.length == 0,
          builder: (context) {
            return Center(
              child: CircularProgressIndicator(),
            );
          },
          fallback: (context) {
            return ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => newsItem(index: index,article: cubit.business,),
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.blue,
                  );
                },
                itemCount: 10);
          },
        );
      },
    );
  }
}
