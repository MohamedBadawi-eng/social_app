
import 'package:dio/dio.dart';

class DioHelper
{
  static Dio? dio;
  static int()
  {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getData({
    required String url,
    required Map<String,dynamic> query,
  }) async
  {
    return await dio!.get(url,queryParameters: query,);
  }
}

// https://newsapi.org/v2/everything?q=apple&from=2024-08-08&to=2024-08-08&sortBy=popularity&apiKey=c1143763add4439db44e8ad2bfd87484