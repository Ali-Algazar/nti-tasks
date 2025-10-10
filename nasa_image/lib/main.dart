import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_image/features/home/presentation/cubit/get_nase_image_cubit.dart';
import 'package:nasa_image/features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetNaseImageCubit()..fetchNaseImage(),
      child: MaterialApp(
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
