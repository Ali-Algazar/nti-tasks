import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:team_app/features/home/data/models/team_model.dart';
import 'package:team_app/features/home/view/cubit/get_team_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 36),

          BlocBuilder<GetTeamCubit, GetTeamState>(
            builder: (context, state) {
              if (state is GetTeamLoaded) {
                return Expanded(
                  child: ListView.separated(
                    itemBuilder: (context, index) {
                      return TeamItem(team: state.Teams[index]);
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 16),
                    itemCount: state.Teams.length,
                  ),
                );
              } else if (state is GetTeamError) {
                return Center(child: Text(state.message));
              }
              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class TeamItem extends StatelessWidget {
  const TeamItem({super.key, required this.team});
  final Team team;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Image.network(team.strBadge, fit: BoxFit.cover),
      ),
      title: Text(
        team.strTeam,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        team.strLeague == 'English Premier League'
            ? 'Premier League'
            : team.strLeague,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}
