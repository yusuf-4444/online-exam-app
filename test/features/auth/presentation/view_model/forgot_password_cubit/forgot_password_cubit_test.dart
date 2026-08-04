import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/forgot_password_cubit/forgot_password_state.dart';

class MockForgotPasswordUseCase extends Mock
    implements ForgotPasswordUseCase {}

void main() {
  late MockForgotPasswordUseCase mockForgotPasswordUseCase;

  setUp(() {
    mockForgotPasswordUseCase = MockForgotPasswordUseCase();
  });

  setUpAll(() {
    registerFallbackValue(
      const ForgotPasswordParams(
        email: '',
      ),
    );

    registerFallbackValue(
      ForgotPasswordEvent(
        params: const ForgotPasswordParams(
          email: '',
        ),
      ),
    );
  });

  const tEntity = ForgotPasswordEntity(
    message: "Reset code sent successfully",
  );

  const tParams = ForgotPasswordParams(
    email: "mohanad@test.com",
  );

  blocTest<ForgotPasswordCubit, ForgotPasswordState>(
    "emits [Loading, Success] when ForgotPassword Success.",
    build: () {
      when(
            () => mockForgotPasswordUseCase.call(any()),
      ).thenAnswer(
            (_) async => const SuccessResponse(tEntity),
      );

      return ForgotPasswordCubit(mockForgotPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      ForgotPasswordEvent(
        params: tParams,
      ),
    ),
    expect: () => [
      const ForgotPasswordState.loading(),
      const ForgotPasswordState.success(tEntity),
    ],
    verify: (_) {
      verify(
            () => mockForgotPasswordUseCase.call(tParams),
      ).called(1);
    },
  );

  blocTest<ForgotPasswordCubit, ForgotPasswordState>(
    "emits [Loading, Error] when ForgotPassword Failed.",
    build: () {
      when(
            () => mockForgotPasswordUseCase.call(any()),
      ).thenAnswer(
            (_) async => ErrorResponse(errMessage: "error"),
      );

      return ForgotPasswordCubit(mockForgotPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      ForgotPasswordEvent(
        params: tParams,
      ),
    ),
    expect: () => [
      const ForgotPasswordState.loading(),
      const ForgotPasswordState.error("error"),
    ],
    verify: (_) {
      verify(
            () => mockForgotPasswordUseCase.call(tParams),
      ).called(1);
    },
  );
}