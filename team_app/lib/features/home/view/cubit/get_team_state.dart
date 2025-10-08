part of 'get_team_cubit.dart';

@immutable
sealed class GetTeamState {}

final class GetTeamInitial extends GetTeamState {}

final class GetTeamLoading extends GetTeamState {}

final class GetTeamLoaded extends GetTeamState {
  final List<Team> Teams;

  GetTeamLoaded(this.Teams);
}

final class GetTeamError extends GetTeamState {
  final String message;

  GetTeamError(this.message);
}
