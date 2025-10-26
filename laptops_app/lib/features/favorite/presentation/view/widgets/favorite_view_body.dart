import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/features/home/presentation/cubit/favorite_product_cubit.dart';
import 'package:laptops_app/features/home/presentation/cubit/get_products_cubit.dart';
import 'package:laptops_app/features/home/presentation/view/widgets/home_view_body.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<FavoriteProductCubit, FavoriteProductState>(
        builder: (context, state) {
          if (state is FavoriteProductLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is FavoriteProductLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15, left: 2, right: 2),
                  child: ProductItem(
                    productModel: state.products[index],
                    isFavorite: true,
                  ),
                );
              },
            );
          } else {
            return const Center(child: Text('No favorite products'));
          }
        },
      ),
    );
  }
}
