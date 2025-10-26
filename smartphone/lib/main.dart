import 'package:flutter/material.dart';
import 'package:smartphone/features/coffee/presentation/views/home_view.dart';
import 'package:smartphone/features/home/presentation/views/home_view.dart';
import 'package:smartphone/features/people/presentation/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CoffeeView());
  }
}
