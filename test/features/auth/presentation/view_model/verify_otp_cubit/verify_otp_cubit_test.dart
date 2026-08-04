import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:online_exam_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/verify_otp_cubit/verify_otp_state.dart';

class MockVerifyOtpUseCase extends Mock implements VerifyOtpUseCase {}

class MockForgotPasswordUseCase extends Mock implements ForgotPasswordUseCase {}

void main() {
  late MockVerifyOtpUseCase mockVerifyOtpUseCase;
  late MockForgotPasswordUseCase mockForgotPasswordUseCase;

  setUp(() {
    mockVerifyOtpUseCase = MockVerifyOtpUseCase();
    mockForgotPasswordUseCase = MockForgotPasswordUseCase();
  });

  setUpAll(() {
    registerFallbackValue(const VerifyOtpParams(resetCode: ''));

    registerFallbackValue(const ForgotPasswordParams(email: ''));

    registerFallbackValue(
      VerifyOtpEvent(params: const VerifyOtpParams(resetCode: '')),
    );
  });

  const tEntity = VerifyOtpEntity(message: "Verified Successfully");

  blocTest<VerifyOtpCubit, VerifyOtpState>(
    'emits [Loading, Success] when verify otp success',
    build: () {
      when(
        () => mockVerifyOtpUseCase.call(any()),
      ).thenAnswer((_) async => const SuccessResponse(tEntity));

      return VerifyOtpCubit(mockVerifyOtpUseCase, mockForgotPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      VerifyOtpEvent(params: const VerifyOtpParams(resetCode: "123456")),
    ),
    expect: () => [
      const VerifyOtpState.loading(),
      const VerifyOtpState.success(tEntity),
    ],
    verify: (_) {
      verify(
        () => mockVerifyOtpUseCase.call(
          const VerifyOtpParams(resetCode: "123456"),
        ),
      ).called(1);
    },
  );

  blocTest<VerifyOtpCubit, VerifyOtpState>(
    'emits [Loading, Error] when verify otp failed',
    build: () {
      when(
        () => mockVerifyOtpUseCase.call(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      return VerifyOtpCubit(mockVerifyOtpUseCase, mockForgotPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(
      VerifyOtpEvent(params: const VerifyOtpParams(resetCode: "123456")),
    ),
    expect: () => [
      const VerifyOtpState.loading(),
      const VerifyOtpState.error("error"),
    ],
    verify: (_) {
      verify(
        () => mockVerifyOtpUseCase.call(
          const VerifyOtpParams(resetCode: "123456"),
        ),
      ).called(1);
    },
  );

  blocTest<VerifyOtpCubit, VerifyOtpState>(
    'emit Error when resend otp failed',
    build: () {
      when(
        () => mockForgotPasswordUseCase.call(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      return VerifyOtpCubit(mockVerifyOtpUseCase, mockForgotPasswordUseCase);
    },
    act: (cubit) => cubit.doEvent(ResendOtpEvent(email: "mohanad@test.com")),
    expect: () => [const VerifyOtpState.error("error")],
    verify: (_) {
      verify(
        () => mockForgotPasswordUseCase.call(
          const ForgotPasswordParams(email: "mohanad@test.com"),
        ),
      ).called(1);
    },
  );
  blocTest<VerifyOtpCubit, VerifyOtpState>(
    'emits [Initial] when ClearVerifyOtpErrorEvent is added',
    build: () =>
        VerifyOtpCubit(mockVerifyOtpUseCase, mockForgotPasswordUseCase),
    seed: () => const VerifyOtpState.error("error"),
    // Start with an error state
    act: (cubit) => cubit.doEvent(ClearVerifyOtpErrorEvent()),
    expect: () => [const VerifyOtpState.initial()],
  );
}
