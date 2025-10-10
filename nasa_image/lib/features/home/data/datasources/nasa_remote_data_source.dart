import 'package:dio/dio.dart';
import 'package:nasa_image/features/home/data/models/nasa_collection_model.dart';

class NasaRemoteDataSource {
  Dio dio = Dio();
  Future<List<NasaItem>> fetchNasaCollection() async {
    final response = await dio.get(
      'https://images-api.nasa.gov/search?q=moon&media_type=image',
    );
    return (response.data['collection']['items'] as List)
        .map((e) => NasaItem.fromJson(e))
        .toList();
  }
}
