import 'package:dio/dio.dart';

class DuckDataSource {
  Dio dio = Dio();
  Future<String> getDuckImage() async {
    final response = await dio.get('https://random-d.uk/api/v2/random');
    return response.data['url'];
  }
}
