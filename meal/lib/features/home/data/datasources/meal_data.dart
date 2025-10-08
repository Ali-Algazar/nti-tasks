import 'package:dio/dio.dart';
import 'package:meal/features/home/data/models/meal_model.dart';

class MealData {
  Dio dio = Dio();

  Future<List<Meal>> getMealData() async {
    Response response = await dio.get(
      'https://www.themealdb.com/api/json/v1/1/search.php?s=chicken',
    );
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['meals'];
      return data.map((mealJson) => Meal.fromJson(mealJson)).toList();
    }
    return [];
  }
}
