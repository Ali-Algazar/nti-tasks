import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:nasa_image/features/home/data/datasources/nasa_remote_data_source.dart';
import 'package:nasa_image/features/home/data/models/nasa_collection_model.dart';

part 'get_nase_image_state.dart';

class GetNaseImageCubit extends Cubit<GetNaseImageState> {
  GetNaseImageCubit() : super(GetNaseImageInitial());
  NasaRemoteDataSource nasaRemoteDataSource = NasaRemoteDataSource();

  Future<void> fetchNaseImage() async {
    emit(GetNaseImageLoading());
    try {
      final naseImage = await nasaRemoteDataSource.fetchNasaCollection();
      emit(GetNaseImageSuccess(naseImage));
    } catch (e) {
      emit(GetNaseImageError(e.toString()));
    }
  }
}
