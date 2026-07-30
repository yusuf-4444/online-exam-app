import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_bloc/sign_in_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_bloc/sign_in_state.dart';

@injectable
// class SignInCubit extends Cubit<SignInState> {
//   final SignInUsecase signInUsecase;
//   SignInCubit(this.signInUsecase) : super(const SignInState.initial());
//   void signIn(String email, String password, bool rememberMe) async {
//     emit(const SignInState.loading());
//     final response = await signInUsecase.call(email, password, rememberMe);
//     switch (response) {
//       case SuccessResponse<UserEntity>(:final data):
//         emit(SignInState.success(data));
//       case ErrorResponse<UserEntity>(:final errMessage):
//         emit(SignInState.error(errMessage));
//     }
//   }
// }
class SignInCubit extends Cubit<SignInState> {
  final SignInUsecase _signInUsecase;
  SignInCubit(this._signInUsecase) : super(const SignInState.initial());
  void doEvent(SignInIntent event) {
    switch (event) {
      case SignInEvent(:final email, :final password, :final rememberMe):
        _signIn(email, password, rememberMe);
    }
  }

  void _signIn(String email, String password, bool rememberMe) async {
    emit(const SignInState.loading());
    final response = await _signInUsecase.call(email, password, rememberMe);
    switch (response) {
      case SuccessResponse<UserEntity>():
        final data = response.data;
        emit(SignInState.success(data));
      case ErrorResponse<UserEntity>():
        final errMessage = response.errMessage;
        emit(SignInState.error(errMessage));
    }
  }
}
// class SignInBloc extends Bloc<SignInIntent, SignInState> {
//   final SignInUsecase _signInUsecase;
//   SignInBloc(this._signInUsecase) : super(const SignInState.initial()) {
//     on<SignInEvent>(_onSignIn, transformer: droppable());
//   }

//   Future<void> _onSignIn(SignInEvent evnet, Emitter<SignInState> emit) async {
//     emit(const SignInState.loading());
//     final response = await _signInUsecase.call(
//       evnet.email,
//       evnet.password,
//       evnet.rememberMe,
//     );
//     switch (response) {
//       case SuccessResponse<UserEntity>(:final data):
//         emit(SignInState.success(data));
//       case ErrorResponse<UserEntity>(:final errMessage):
//         emit(SignInState.error(errMessage));
//     }
//   }
// }
