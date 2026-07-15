import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_up_bloc/sign_up_state.dart';

@injectable
// class SignUpCubit extends Cubit<SignUpState> {
//   final SignUpUsecase signUpUsecase;
//   SignUpCubit({required this.signUpUsecase})
//     : super(const SignUpState.initial());
//   void signUp(
//     String username,
//     String firstName,
//     String lastName,
//     String email,
//     String password,
//     String phoneNumber,
//   ) async {
//     emit(const SignUpState.loading());
//     final response = await signUpUsecase.call(
//       username,
//       firstName,
//       lastName,
//       email,
//       password,
//       phoneNumber,
//     );
//     switch (response) {
//       case SuccessResponse<UserEntity>(:final data):
//         emit(SignUpState.success(data));
//       case ErrorResponse<UserEntity>(:final errMessage):
//         emit(SignUpState.error(errMessage));
//     }
//   }
// }
class SignUpBloc extends Bloc<SignUpIntent, SignUpState> {
  final SignUpUsecase _signUpUsecase;

  SignUpBloc(this._signUpUsecase) : super(const SignUpState.initial()) {
    on<SignUpEvent>(_onSignUp, transformer: droppable());
  }

  Future<void> _onSignUp(SignUpEvent event, Emitter<SignUpState> emit) async {
    emit(const SignUpState.loading());
    final response = await _signUpUsecase.call(
      event.username,
      event.firstName,
      event.lastName,
      event.email,
      event.password,
      event.phoneNumber,
    );
    switch (response) {
      case SuccessResponse<UserEntity>(:final data):
        emit(SignUpState.success(data));
      case ErrorResponse<UserEntity>(:final errMessage):
        emit(SignUpState.error(errMessage));
    }
  }
}
