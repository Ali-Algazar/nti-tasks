import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran/features/home/data/datasources/quran_remote_data_source.dart';
import 'package:quran/features/home/data/models/surah_model.dart';

part 'get_surah_state.dart';

class GetSurahCubit extends Cubit<GetSurahState> {
  GetSurahCubit() : super(GetSurahInitial());
  QuranRemoteDataSource quranRemoteDataSource = QuranRemoteDataSource();

  Future<void> getSurah() async {
    emit(GetSurahLoading());

    try {
      final surah = await quranRemoteDataSource.getSurah();
      emit(GetSurahSuccess(surah));
    } catch (e) {
      emit(GetSurahError(e.toString()));
    }
  }
}
