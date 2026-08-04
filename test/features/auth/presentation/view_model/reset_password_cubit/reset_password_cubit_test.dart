import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:online_exam_app/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/reset_password_cubit/reset_password_state.dart';

class MockResetPasswordUseCase extends Mock
    implements ResetPasswordUseCase {}

void main() {
  late MockResetPasswordUseCase mockResetPasswordUseCase;

  setUp(() {
    mockResetPasswordUseCase = MockResetPasswordUseCase();
  });

  setUpAll(() {
    registerFallbackValue(
      const ResetPasswordParams(
        email: '',
        newPassword: '',
      ),
    );

    registerFallbackValue(
      ResetPasswordEvent(
        params: const ResetPasswordParams(
          email: '',
          newPassword: '',
        ),
      ),
    );
  });

  const tEntity = ResetPasswordEntity(
    message: "Password reset successfully",
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'emits [Loading, Success] when reset password success',
    build: () {
      when(
            () => mockResetPasswordUseCase.call(any()),
      ).thenAnswer((_) async => const SuccessResponse(tEntity));

      return ResetPasswordCubit(mockResetPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      ResetPasswordEvent(
        params: const ResetPasswordParams(
          email: "mohanad@test.com",
          newPassword: "12345678",
        ),
      ),
    ),
    expect: () => [
      const ResetPasswordState.loading(),
      const ResetPasswordState.success(tEntity),
    ],
    verify: (_) {
      verify(
            () => mockResetPasswordUseCase.call(
          const ResetPasswordParams(
            email: "mohanad@test.com",
            newPassword: "12345678",
          ),
        ),
      ).called(1);
    },
  );

  blocTest<ResetPasswordCubit, ResetPasswordState>(
    'emits [Loading, Error] when reset password failed',
    build: () {
      when(
            () => mockResetPasswordUseCase.call(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      return ResetPasswordCubit(mockResetPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      ResetPasswordEvent(
        params: const ResetPasswordParams(
          email: "mohanad@test.com",
          newPassword: "12345678",
        ),
      ),
    ),
    expect: () => [
      const ResetPasswordState.loading(),
      const ResetPasswordState.error("error"),
    ],
    verify: (_) {
      verify(
            () => mockResetPasswordUseCase.call(
          const ResetPasswordParams(
            email: "mohanad@test.com",
            newPassword: "12345678",
          ),
        ),
      ).called(1);
    },
  );
}