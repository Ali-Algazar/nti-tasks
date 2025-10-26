import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:laptops_app/features/favorite/presentation/view/widgets/favorite_view_body.dart';
import 'package:laptops_app/features/home/presentation/cubit/favorite_product_cubit.dart';
import 'package:laptops_app/features/home/presentation/cubit/get_products_cubit.dart';
import 'package:laptops_app/features/home/presentation/view/widgets/home_view_body.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> Screen = [HomeViewBody(), FavoriteViewBody()];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetProductsCubit()..getProduct()),
        BlocProvider(
          create: (context) => FavoriteProductCubit()..getFavoriteProduct(),
        ),
      ],
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
        ),
        body: Screen[index],
      ),
    );
  }
}
