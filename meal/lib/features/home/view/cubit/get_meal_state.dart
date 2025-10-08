part of 'get_meal_cubit.dart';

@immutable
sealed class GetMealState {}

final class GetMealInitial extends GetMealState {}

final class GetMealLoading extends GetMealState {}

final class GetMealLoaded extends GetMealState {
  final List<Meal> meals;

  GetMealLoaded(this.meals);
}

final class GetMealError extends GetMealState {
  final String message;

  GetMealError(this.message);
}
