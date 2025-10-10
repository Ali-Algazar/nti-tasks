part of 'get_all_user_cubit.dart';

@immutable
sealed class GetAllUserState {}

final class GetAllUserInitial extends GetAllUserState {}

final class GetAllUserLoading extends GetAllUserState {}

final class GetAllUserSuccess extends GetAllUserState {
  final List<UserModel> users;
  GetAllUserSuccess({required this.users});
}

final class GetAllUserError extends GetAllUserState {
  final String message;
  GetAllUserError({required this.message});
}
