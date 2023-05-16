import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/news/cubit/cubit.dart';
import 'package:news_app2/layout/news/cubit/states.dart';
import 'package:news_app2/moduls/search/search.dart';
import 'package:news_app2/shared/network/remote/Dio_helper.dart';

class news_layout extends StatelessWidget {
  const news_layout({super.key});
  static const String id = 'fkm';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<newsCubit, newsStats>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = newsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text('NewsApp'),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, search_scrren.id);
                  },
                  icon: Icon(Icons.search))
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cubit.bottomItem,
            currentIndex: cubit.currentIndex,
            onTap: (value) => cubit.changebottomNav(value),
          ),
          body: cubit.screens[cubit.currentIndex],
          floatingActionButton: FloatingActionButton(onPressed: () {
            cubit.changeThemeMode();
          }),
        );
      },
    );
  }
}
