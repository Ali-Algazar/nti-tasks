import 'package:bloc/bloc.dart';
import 'package:meal/features/home/data/datasources/meal_data.dart';
import 'package:meal/features/home/data/models/meal_model.dart';
import 'package:meta/meta.dart';

part 'get_meal_state.dart';

class GetMealCubit extends Cubit<GetMealState> {
  GetMealCubit() : super(GetMealInitial());
  MealData mealData = MealData();
  void fetchMeals() async {
    emit(GetMealLoading());
    try {
      // Simulate a network call
      List<Meal> meals = await mealData.getMealData();
      emit(GetMealLoaded(meals));
    } catch (e) {
      emit(GetMealError('Failed to fetch meals'));
    }
  }
}
