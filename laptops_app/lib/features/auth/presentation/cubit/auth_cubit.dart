import 'package:bloc/bloc.dart';
import 'package:laptops_app/core/services/shared_preferences_service.dart';
import 'package:laptops_app/features/auth/data/models/user_model.dart';
import 'package:laptops_app/features/auth/data/repositories/auth_repo.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  AuthRepo authRepo = AuthRepoImpl();

  Future<void> login(String email, String password) async {
    emit(AuthLoading());
    try {
      var result = await authRepo.login(email, password);
      if (result.data['status'] == 'error') {
        emit(AuthError(message: result.data['message']));
        SharedPreferencesService.saveData(
          key: "nationalId",
          value: result.data['user']['nationalId'],
        );
        // nationalId = ;
      } else if (result.data['status'] == 'success') {
        emit(AuthSuccess(user: UserModel.fromJson(result.data['user'])));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }

  Future<void> register(Map<String, dynamic> data) async {
    emit(AuthLoading());
    try {
      var result = await authRepo.register(data);
      if (result.data['status'] == 'error') {
        emit(AuthError(message: result.data['message']));
      } else if (result.data['status'] == 'success') {
        SharedPreferencesService.saveData(
          key: "nationalId",
          value: result.data['user']['nationalId'],
        );
        emit(AuthSuccess(user: UserModel.fromJson(result.data['user'])));
      }
    } catch (e) {
      emit(AuthError(message: e.toString()));
    }
  }
}
