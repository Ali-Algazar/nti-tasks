import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:user_app/features/home/data/datasources/user_remote_data_source.dart';
import 'package:user_app/features/home/data/models/user_model.dart';

part 'get_all_user_state.dart';

class GetAllUserCubit extends Cubit<GetAllUserState> {
  GetAllUserCubit() : super(GetAllUserInitial());
  UserRemoteDataSource userRemoteDataSource = UserRemoteDataSource();

  Future<void> getAllUsers() async {
    emit(GetAllUserLoading());
    try {
      final users = await userRemoteDataSource.getUsers();
      emit(GetAllUserSuccess(users: users));
    } catch (e) {
      emit(GetAllUserError(message: e.toString()));
    }
  }
}
