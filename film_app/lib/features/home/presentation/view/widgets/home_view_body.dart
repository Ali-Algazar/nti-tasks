import 'package:film_app/features/home/data/models/film_model.dart';
import 'package:film_app/features/home/presentation/view/cubit/get_all_films_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetAllFilmsCubit, GetAllFilmsState>(
      builder: (context, state) {
        if (state is GetAllFilmsLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetAllFilmsSuccess) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 0.8,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
            ),
            itemCount: state.films.length,
            itemBuilder: (context, index) {
              return FilmsItem(film: state.films[index]);
            },
          );
        } else if (state is GetAllFilmsError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}

class FilmsItem extends StatelessWidget {
  const FilmsItem({super.key, required this.film});
  final Film film;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(film.image),
            ),
          ),
          SizedBox(
            width: 128,
            child: Text(
              film.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
