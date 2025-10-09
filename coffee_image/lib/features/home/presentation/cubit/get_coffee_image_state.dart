part of 'get_coffee_image_cubit.dart';

@immutable
sealed class GetCoffeeImageState {}

final class GetCoffeeImageInitial extends GetCoffeeImageState {}

final class GetCoffeeImageSuccess extends GetCoffeeImageState {
  final String image;
  GetCoffeeImageSuccess(this.image);
}

final class GetCoffeeImageLoading extends GetCoffeeImageState {}

final class GetCoffeeImageFailure extends GetCoffeeImageState {
  final String message;
  GetCoffeeImageFailure(this.message);
}
