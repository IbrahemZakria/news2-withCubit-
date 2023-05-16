import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app2/layout/news/cubit/states.dart';
import 'package:news_app2/moduls/busness/busness_scrren.dart';
import 'package:news_app2/moduls/science/science_scrren.dart';
import 'package:news_app2/moduls/sports/sports_scrren.dart';
import 'package:news_app2/shared/network/local/cashHelper.dart';
import 'package:news_app2/shared/network/remote/Dio_helper.dart';

class newsCubit extends Cubit<newsStats> {
  newsCubit() : super(newsInitialStats());
  static const String id = 'f.';
  static newsCubit get(context) => BlocProvider.of(context);
  List<BottomNavigationBarItem> bottomItem = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business_sharp,
        ),
        label: 'busniss'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports_rounded,
        ),
        label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'),
  ];
  int currentIndex = 0;
  List<Widget> screens = [busness_scrren(), sports_scrren(), science_scrren()];
  void changebottomNav(int index) {
    currentIndex = index;
    if (currentIndex == 1) {
      getsportsData();
    } else if (currentIndex == 2) {
      getscienceData();
    }
    emit(bottomnavstate());
  }

  Map business = {};
  void getbusinessData() {
    emit(loadingstate());
    diohelper.getdata(url: '/v2/top-headlines', query: {
      'apiKey': '5d907bddc59041cfa4ad0078a86896bc',
      'country': 'us',
      'category': 'business',
    }).then((value) {
      print(value!.data['articles'][2]['urlToImage']);
      emit(getbusinessDatasucesstate());

      business = value!.data;
    }).catchError((onError) {
      emit(getbusinessDataerrorstate(onError));
      print('$onError');
    });
  }

  Map science = {};
  void getscienceData() {
    emit(loadingstate());
    diohelper.getdata(url: '/v2/top-headlines', query: {
      'apiKey': '5d907bddc59041cfa4ad0078a86896bc',
      'category': 'science',
      'country': 'us'
    }).then((value) {
      emit(getscienceDatasucesstate());

      science = value!.data;
    }).catchError((onError) {
      emit(getscienceDataerrorstate(onError));
      print('$onError');
    });
  }

  Map sports = {};
  void getsportsData() {
    emit(loadingstate());
    diohelper.getdata(url: '/v2/top-headlines', query: {
      'apiKey': '5d907bddc59041cfa4ad0078a86896bc',
      'category': 'sports',
      'country': 'us'
    }).then((value) {
      emit(getsportsDatasucesstate());

      sports = value!.data;
    }).catchError((onError) {
      emit(getsportsDataerrorstate(onError));
      print('$onError');
    });
  }

  Map search = {};
  void getsearchData({required String value}) {
    emit(loadingstate());
    diohelper.getdata(url: '/v2/top-headlines', query: {
      'apiKey': '5d907bddc59041cfa4ad0078a86896bc',
      'q': '$value',
    }).then((value) {
      search = value!.data;
      emit(getsearchDatasucesstate());
    }).catchError((onError) {
      emit(getsearchDataerrorstate(onError));
      print('$onError');
    });
  }

  bool isdark = cashHelper.getbolean(key: 'isdark') ?? false;
  void changeThemeMode() {
    isdark = !isdark;
    cashHelper
        .putbolean(key: 'isdark', value: isdark)
        .then((value) => emit(changethemsstate()));
  }
}
