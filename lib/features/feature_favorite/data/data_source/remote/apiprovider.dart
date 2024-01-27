import 'package:dio/dio.dart';

class FavoriteApiProvider {
  final Dio _dio = Dio();
  final String _url = 'http://156.253.5.226:2648/top/6';

  Future<dynamic> fetchNewsList() async {
    // try {
    Response response = await _dio.get(_url,
        options: Options(headers: {
          'Accept': 'application/json',
        }));
    print(response.data);
    return response;
  }
}
