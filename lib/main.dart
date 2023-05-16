import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/news/cubit/cubit.dart';
import 'package:news_app2/layout/news/cubit/states.dart';
import 'package:news_app2/layout/news/news_layout.dart';
import 'package:news_app2/moduls/search/search.dart';
import 'package:news_app2/shared/component/BlocObserver%20.dart';
import 'package:news_app2/shared/network/local/cashHelper.dart';
import 'package:news_app2/shared/network/remote/Dio_helper.dart';
import 'package:news_app2/shared/style/My_Theme_Data.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await cashHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => newsCubit()..getbusinessData(),
      child: BlocConsumer<newsCubit, newsStats>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = newsCubit.get(context);

          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme:
                cubit.isdark ? MyThemeData.darkTheme : MyThemeData.Lighttheme,
            initialRoute: news_layout.id,
            routes: {
              news_layout.id: (context) => news_layout(),
              search_scrren.id: (context) => search_scrren(),
            },
          );
        },
      ),
    );
  }
}
