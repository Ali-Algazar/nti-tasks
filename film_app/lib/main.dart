import 'package:film_app/features/home/presentation/view/cubit/get_all_films_cubit.dart';
import 'package:film_app/features/home/presentation/view/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllFilmsCubit()..getAllFilms(),
      child: MaterialApp(
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
