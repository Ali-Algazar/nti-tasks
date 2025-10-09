import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_phones_app/features/home/presentation/cubit/get_all_products_cubit.dart';
import 'package:smart_phones_app/features/home/presentation/view/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetAllProductsCubit()..getAllProducts(),
      child: MaterialApp(
        home: const HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
