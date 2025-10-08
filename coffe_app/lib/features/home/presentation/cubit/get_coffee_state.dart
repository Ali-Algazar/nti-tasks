part of 'get_coffee_cubit.dart';

@immutable
sealed class GetCoffeeState {}

final class GetCoffeeInitial extends GetCoffeeState {}

final class GetCoffeeLoading extends GetCoffeeState {}

final class GetCoffeeSuccess extends GetCoffeeState {
  final List<CoffeModel> coffeList;

  GetCoffeeSuccess(this.coffeList);
}

final class GetCoffeeFailure extends GetCoffeeState {
  final String errorMessage;

  GetCoffeeFailure(this.errorMessage);
}
