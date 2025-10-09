import 'package:duck_image/features/home/presentation/cubit/get_duck_image_cubit.dart';
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
          BlocBuilder<GetDuckImageCubit, GetDuckImageState>(
            builder: (context, state) {
              if (state is GetDuckImageLoading) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: Colors.brown[200],
                  child: const Center(child: CircularProgressIndicator()),
                );
              } else if (state is GetDuckImageSuccess) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              } else if (state is GetDuckImageFailure) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  color: Colors.brown[200],
                  child: Center(
                    child: Text(
                      state.errorMessage,
                      textAlign: TextAlign.center,
                    ),
                  ),
                );
              }
              return Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: double.infinity,
                color: Colors.brown[200],
                child: const Center(
                  child: Text('Press the button to get a duck image'),
                ),
              );
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<GetDuckImageCubit>(context).fetchDuckImage();
            },
            child: const Text('Get Duck Image'),
          ),
        ],
      ),
    );
  }
}
