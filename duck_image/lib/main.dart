import 'package:duck_image/features/home/presentation/cubit/get_duck_image_cubit.dart';
import 'package:duck_image/features/home/presentation/view/home_view.dart';
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
      create: (context) => GetDuckImageCubit(),
      child: MaterialApp(
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
