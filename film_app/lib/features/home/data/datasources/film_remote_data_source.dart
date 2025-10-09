import 'package:dio/dio.dart';
import 'package:film_app/features/home/data/models/film_model.dart';

class FilmRemoteDataSource {
  Dio dio = Dio();

  Future<List<Film>> getAllFilms() async {
    final response = await dio.get('https://ghibliapi.vercel.app/films');

    final List<dynamic> data = response.data;
    return data.map((json) => Film.fromJson(json)).toList();
  }
}
