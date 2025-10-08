import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/features/home/data/models/meal_model.dart';
import 'package:meal/features/home/view/cubit/get_meal_cubit.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 36),
          BlocBuilder<GetMealCubit, GetMealState>(
            builder: (context, state) {
              if (state is GetMealError) {
                return Text(state.message);
              }
              if (state is GetMealLoaded) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16,
                          right: 5,
                          left: 5,
                        ),
                        child: MealItem(meal: state.meals[index]),
                      );
                    },
                    itemCount: state.meals.length,
                  ),
                );
              }

              return Center(child: CircularProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}

class MealItem extends StatelessWidget {
  const MealItem({super.key, required this.meal});
  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 120,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomLeft: Radius.circular(16),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(meal.strMealThumb),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 110,
                right: 8,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 5,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strMeal,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Text(
                  meal.strInstructions,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff565656),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  spacing: 3,
                  children: [
                    Icon(Icons.watch_later_rounded, color: Color(0xff565656)),
                    Text(
                      '35 mins',
                      style: TextStyle(fontSize: 12, color: Color(0xff565656)),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.star, color: Color(0xff565656)),
                    Text(
                      '4.9',
                      style: TextStyle(fontSize: 12, color: Color(0xff565656)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
