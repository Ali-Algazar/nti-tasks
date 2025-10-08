import 'package:dio/dio.dart';
import 'package:team_app/features/home/data/models/team_model.dart';

class TeamData {
  Dio dio = Dio();

  Future<List<Team>> getTeamData() async {
    Response response = await dio.get(
      'https://www.thesportsdb.com/api/v1/json/3/search_all_teams.php?l=English%20Premier%20League',
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['teams'];
      return data.map((mealJson) => Team.fromJson(mealJson)).toList();
    }
    return [];
  }
}
