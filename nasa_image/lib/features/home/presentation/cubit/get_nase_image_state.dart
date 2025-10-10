part of 'get_nase_image_cubit.dart';

@immutable
sealed class GetNaseImageState {}

final class GetNaseImageInitial extends GetNaseImageState {}

final class GetNaseImageLoading extends GetNaseImageState {}

final class GetNaseImageSuccess extends GetNaseImageState {
  final List<NasaItem> nasaItems;
  GetNaseImageSuccess(this.nasaItems);
}

final class GetNaseImageError extends GetNaseImageState {
  final String message;
  GetNaseImageError(this.message);
}
