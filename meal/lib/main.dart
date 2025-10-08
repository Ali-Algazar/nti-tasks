import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal/features/home/view/cubit/get_meal_cubit.dart';
import 'package:meal/features/home/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetMealCubit()..fetchMeals(),
      child: MaterialApp(
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
