import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:team_app/features/home/data/datasources/team_data.dart';
import 'package:team_app/features/home/data/models/team_model.dart';

part 'get_team_state.dart';

class GetTeamCubit extends Cubit<GetTeamState> {
  GetTeamCubit() : super(GetTeamInitial());
  TeamData mealData = TeamData();
  void fetchTeams() async {
    emit(GetTeamLoading());
    try {
      List<Team> meals = await mealData.getTeamData();
      emit(GetTeamLoaded(meals));
    } catch (e) {
      emit(GetTeamError(e.toString()));
    }
  }
}
