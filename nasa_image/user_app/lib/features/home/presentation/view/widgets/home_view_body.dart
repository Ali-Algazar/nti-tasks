import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_app/features/home/data/models/user_model.dart';
import 'package:user_app/features/home/presentation/cubit/get_all_user_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Expanded(
            child: BlocBuilder<GetAllUserCubit, GetAllUserState>(
              builder: (context, state) {
                if (state is GetAllUserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is GetAllUserSuccess) {
                  return ListView.separated(
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: UserCard(user: state.users[index]),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                  );
                } else if (state is GetAllUserError) {
                  return Center(child: Text(state.message));
                } else {
                  return const Center(child: Text('Something went wrong'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  const UserCard({super.key, required this.user});
  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.largeImage),
            ),
            title: Row(
              spacing: 12,
              children: [
                Text(
                  user.fullName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                user.gender == 'male'
                    ? Icon(Icons.male, color: Colors.blue)
                    : Icon(Icons.female, color: Colors.pink),
              ],
            ),
            subtitle: Text(
              user.email,
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
          ),
          Row(
            children: [
              Icon(Icons.phone, color: Colors.blue),
              Text(
                ' ${user.phone}',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          Row(
            children: [
              Icon(Icons.location_on_sharp, color: Colors.blue),
              Text(
                ' ${user.city}, ${user.country}',
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
