part of 'get_all_films_cubit.dart';

@immutable
sealed class GetAllFilmsState {}

final class GetAllFilmsInitial extends GetAllFilmsState {}

final class GetAllFilmsLoading extends GetAllFilmsState {}

final class GetAllFilmsSuccess extends GetAllFilmsState {
  final List<Film> films;

  GetAllFilmsSuccess(this.films);
}

final class GetAllFilmsError extends GetAllFilmsState {
  final String message;

  GetAllFilmsError(this.message);
}
