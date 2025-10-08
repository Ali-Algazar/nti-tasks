part of 'get_shirt_cubit.dart';

@immutable
sealed class GetShirtState {}

final class GetShirtInitial extends GetShirtState {}

final class GetShirtLoading extends GetShirtState {}

final class GetShirtSuccess extends GetShirtState {
  final List<ShirtModel> shirts;
  GetShirtSuccess(this.shirts);
}

final class GetShirtFailure extends GetShirtState {
  final String errorMessage;
  GetShirtFailure(this.errorMessage);
}
