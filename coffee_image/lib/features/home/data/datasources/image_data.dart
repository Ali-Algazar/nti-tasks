import 'package:dio/dio.dart';

class ImageData {
  Dio dio = Dio();

  Future<String> getCoffeeImage() async {
    final response = await dio.get(
      'https://coffee.alexflipnote.dev/random.json',
    );

    return response.data['file'];
  }
}
