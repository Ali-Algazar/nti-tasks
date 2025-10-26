import 'package:dio/dio.dart';
import 'package:quran/features/home/data/models/surah_model.dart';

class QuranRemoteDataSource {
  Dio dio = Dio();
  Future<List<SurahModel>> getSurah() async {
    final response = await dio.get('https://api.alquran.cloud/v1/quran');
    return (response.data['data']['surahs'] as List)
        .map((e) => SurahModel.fromJson(e))
        .toList();
  }
}
