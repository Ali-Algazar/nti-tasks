import 'package:bloc/bloc.dart';
import 'package:coffee_image/features/home/data/datasources/image_data.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'get_coffee_image_state.dart';

class GetCoffeeImageCubit extends Cubit<GetCoffeeImageState> {
  GetCoffeeImageCubit() : super(GetCoffeeImageInitial());

  ImageData imageData = ImageData();
  Future<void> getCoffeeImage() async {
    emit(GetCoffeeImageLoading());
    try {
      final image = await imageData.getCoffeeImage();
      emit(GetCoffeeImageSuccess(image));
    } catch (e) {
      emit(GetCoffeeImageFailure(e.toString()));
    }
  }
}
