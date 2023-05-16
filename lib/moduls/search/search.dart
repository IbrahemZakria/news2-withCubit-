import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/news/cubit/cubit.dart';
import 'package:news_app2/layout/news/cubit/states.dart';
import 'package:news_app2/shared/component/newsItem.dart';
import 'package:news_app2/shared/component/textFormField.dart';
import 'package:app_bar_with_search_switch/app_bar_with_search_switch.dart';

class search_scrren extends StatefulWidget {
  search_scrren({super.key});
  static const String id = '.c';

  @override
  State<search_scrren> createState() => _search_scrrenState();
}

class _search_scrrenState extends State<search_scrren> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = newsCubit.get(context);

        return Form(
          key: formKey,
          child: Scaffold(
            appBar: AppBarWithSearchSwitch(onSubmitted: (value) {
              cubit.getsearchData(value: value);
            }, appBarBuilder: (context) {
              return AppBar(
                actions: [
                  AppBarSearchButton(
                    buttonHasTwoStates: false,
                  )
                ],
                title: Text('search'),
              );
            }),
            body: Column(
              children: [
                ConditionalBuilder(
                  condition: cubit.search.length == 0,
                  builder: (context) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                  fallback: (context) {
                    return Expanded(
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => newsItem(
                                index: index,
                                article: cubit.search,
                              ),
                          separatorBuilder: (context, index) {
                            return Divider(
                              color: Colors.blue,
                            );
                          },
                          itemCount: cubit.search.length),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
