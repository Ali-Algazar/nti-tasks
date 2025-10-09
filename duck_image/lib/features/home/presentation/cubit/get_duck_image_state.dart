part of 'get_duck_image_cubit.dart';

@immutable
sealed class GetDuckImageState {}

final class GetDuckImageInitial extends GetDuckImageState {}

final class GetDuckImageLoading extends GetDuckImageState {}

final class GetDuckImageSuccess extends GetDuckImageState {
  final String imageUrl;
  GetDuckImageSuccess(this.imageUrl);
}

final class GetDuckImageFailure extends GetDuckImageState {
  final String errorMessage;
  GetDuckImageFailure(this.errorMessage);
}
