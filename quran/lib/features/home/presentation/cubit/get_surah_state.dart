part of 'get_surah_cubit.dart';

@immutable
sealed class GetSurahState {}

final class GetSurahInitial extends GetSurahState {}

final class GetSurahLoading extends GetSurahState {}

final class GetSurahSuccess extends GetSurahState {
  final List<SurahModel> surahs;
  GetSurahSuccess(this.surahs);
}

final class GetSurahError extends GetSurahState {
  final String message;
  GetSurahError(this.message);
}
