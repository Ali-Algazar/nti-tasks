import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/features/home/presentation/cubit/favorite_product_cubit.dart';
import 'package:laptops_app/features/home/presentation/cubit/get_products_cubit.dart';
import 'widgets/home_view_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductsCubit()..getProduct()),
        BlocProvider(create: (context) => FavoriteProductCubit()),
      ],
      child: Scaffold(body: const HomeViewBody()),
    );
  }
}
