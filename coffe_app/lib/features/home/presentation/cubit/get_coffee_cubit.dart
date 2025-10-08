import 'package:bloc/bloc.dart';
import 'package:coffe_app/features/home/data/datasources/get_coffee_data.dart';
import 'package:coffe_app/features/home/data/models/coffee_model.dart';
import 'package:meta/meta.dart';

part 'get_coffee_state.dart';

class GetCoffeeCubit extends Cubit<GetCoffeeState> {
  GetCoffeeCubit() : super(GetCoffeeInitial());
  GetCoffeeData getCoffeeData = GetCoffeeData();

  Future<void> getData() async {
    emit(GetCoffeeLoading());
    try {
      final coffeList = await getCoffeeData.getCoffe();
      emit(GetCoffeeSuccess(coffeList));
    } catch (e) {
      emit(GetCoffeeFailure(e.toString()));
    }
  }
}
