import 'package:coffee_image/features/home/presentation/cubit/get_coffee_image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<GetCoffeeImageCubit, GetCoffeeImageState>(
            builder: (context, state) {
              if (state is GetCoffeeImageLoading) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: Colors.brown[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (state is GetCoffeeImageSuccess) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.image),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              } else if (state is GetCoffeeImageFailure) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: Colors.brown[200],
                  child: Center(
                    child: Text(state.message, textAlign: TextAlign.center),
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                color: Colors.brown[200],
                child: const Center(
                  child: Text('Press the button to get a coffee image'),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<GetCoffeeImageCubit>(context).getCoffeeImage();
            },
            child: const Text('Get Coffee Image'),
          ),
        ],
      ),
    );
  }
}
