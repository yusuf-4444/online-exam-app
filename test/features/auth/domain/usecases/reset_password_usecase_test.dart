import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';
import 'package:online_exam_app/features/auth/domain/usecases/reset_password_usecase.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late ResetPasswordUseCase resetPasswordUseCase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    resetPasswordUseCase = ResetPasswordUseCase(mockAuthRepo);
  });

  setUpAll(() {
    registerFallbackValue(
      const ResetPasswordParams(email: '', newPassword: ''),
    );
  });

  group("ResetPasswordUseCase", () {
    const tEntity = ResetPasswordEntity(message: "Password reset successfully");
    const tParams = ResetPasswordParams(
      email: "mohanad@test.com",
      newPassword: "mohanad1234",
    );

    test("return SuccessResponse when resetPassword success", () async {
      when(
        () => mockAuthRepo.resetPassword(any()),
      ).thenAnswer((_) async => const SuccessResponse(tEntity));

      final result = await resetPasswordUseCase.call(tParams);

      expect(result, isA<SuccessResponse<ResetPasswordEntity>>());
      expect((result as SuccessResponse<ResetPasswordEntity>).data, tEntity);

      verify(() => mockAuthRepo.resetPassword(tParams)).called(1);
    });

    test("return ErrorResponse when resetPassword failed", () async {
      when(
        () => mockAuthRepo.resetPassword(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      final result = await resetPasswordUseCase.call(tParams);

      expect(result, isA<ErrorResponse<ResetPasswordEntity>>());
      expect(
        (result as ErrorResponse<ResetPasswordEntity>).errMessage,
        "error",
      );

      verify(() => mockAuthRepo.resetPassword(tParams)).called(1);
    });
  });
}
