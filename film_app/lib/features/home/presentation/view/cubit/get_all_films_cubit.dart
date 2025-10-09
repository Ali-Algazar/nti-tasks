import 'package:bloc/bloc.dart';
import 'package:film_app/features/home/data/datasources/film_remote_data_source.dart';
import 'package:film_app/features/home/data/models/film_model.dart';
import 'package:meta/meta.dart';

part 'get_all_films_state.dart';

class GetAllFilmsCubit extends Cubit<GetAllFilmsState> {
  GetAllFilmsCubit() : super(GetAllFilmsInitial());
  FilmRemoteDataSource filmRemoteDataSource = FilmRemoteDataSource();

  Future<void> getAllFilms() async {
    emit(GetAllFilmsLoading());
    try {
      final films = await filmRemoteDataSource.getAllFilms();
      emit(GetAllFilmsSuccess(films));
    } catch (e) {
      emit(GetAllFilmsError(e.toString()));
    }
  }
}
