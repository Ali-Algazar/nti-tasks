import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/core/services/shared_preferences_service.dart';
import 'package:laptops_app/features/auth/presentation/view/login_view.dart';
import 'package:laptops_app/features/cart/presentation/cubit/cart_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesService.init();
  runApp(const LaptopStoreApp());
}

class LaptopStoreApp extends StatelessWidget {
  const LaptopStoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: MaterialApp(home: LoginView(), debugShowCheckedModeBanner: false),
    );
  }
}
