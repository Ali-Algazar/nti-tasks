import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tshirt_app/features/home/data/datasources/shirt_data.dart';
import 'package:tshirt_app/features/home/data/models/shirt_model.dart';

part 'get_shirt_state.dart';

class GetShirtCubit extends Cubit<GetShirtState> {
  GetShirtCubit() : super(GetShirtInitial());
  ShirtData shirtData = ShirtData();

  Future<void> fetchShirts() async {
    emit(GetShirtLoading());
    try {
      final shirts = await shirtData.getShirts();
      emit(GetShirtSuccess(shirts));
    } catch (e) {
      emit(GetShirtFailure(e.toString()));
    }
  }
}
