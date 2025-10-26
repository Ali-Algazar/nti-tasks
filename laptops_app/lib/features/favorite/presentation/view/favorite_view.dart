import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/features/home/presentation/cubit/favorite_product_cubit.dart';
import 'package:laptops_app/features/home/presentation/cubit/get_products_cubit.dart';
import 'widgets/favorite_view_body.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetProductsCubit()..getProduct(),
      child: Scaffold(body: const FavoriteViewBody()),
    );
  }
}
