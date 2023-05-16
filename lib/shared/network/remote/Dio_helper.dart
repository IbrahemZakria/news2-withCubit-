import 'package:dio/dio.dart';

// const String baseUrl='newsapi.org';
// const String ApiKey='5d907bddc59041cfa4ad0078a86896bc';
class diohelper {
  static Dio dio = Dio(
    BaseOptions(
        receiveDataWhenStatusError: true, baseUrl: 'http://newsapi.org/'),
  );

  static Future<Response?> getdata(
      {required String url, Map<String, dynamic>? query}) async {
    return await dio.get(url, queryParameters: query);
  }
}
