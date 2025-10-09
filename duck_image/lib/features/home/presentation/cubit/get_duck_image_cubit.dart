import 'package:bloc/bloc.dart';
import 'package:duck_image/features/home/data/datasources/duck_data_source.dart';
import 'package:meta/meta.dart';

part 'get_duck_image_state.dart';

class GetDuckImageCubit extends Cubit<GetDuckImageState> {
  GetDuckImageCubit() : super(GetDuckImageInitial());
  DuckDataSource duckDataSource = DuckDataSource();

  Future<void> fetchDuckImage() async {
    emit(GetDuckImageLoading());
    try {
      final imageUrl = await duckDataSource.getDuckImage();
      emit(GetDuckImageSuccess(imageUrl));
    } catch (e) {
      emit(GetDuckImageFailure(e.toString()));
    }
  }
}
