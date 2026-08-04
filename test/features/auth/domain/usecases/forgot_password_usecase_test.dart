import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';
import 'package:online_exam_app/features/auth/domain/usecases/forgot_password_usecase.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late ForgotPasswordUseCase forgotPasswordUseCase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    forgotPasswordUseCase = ForgotPasswordUseCase(mockAuthRepo);
  });

  setUpAll(() {
    registerFallbackValue(
      const ForgotPasswordParams(
        email: '',
      ),
    );
  });

  group("ForgotPasswordUsecase", () {
    const tEntity = ForgotPasswordEntity(
      message: "Reset code sent successfully",
    );
    const tParams = ForgotPasswordParams(
      email: "mohanad@test.com",
    );

    test("return SuccessResponse when ForgotPassword success", () async {
      //Arrange
      when(
        () => mockAuthRepo.forgotPassword(any()),
      ).thenAnswer((_) async => const SuccessResponse(tEntity));

      //Act
      final result = await forgotPasswordUseCase.call(tParams);

      //Assert
      expect(result, isA<SuccessResponse<ForgotPasswordEntity>>());
      expect(
        (result as SuccessResponse<ForgotPasswordEntity>).data,
        tEntity,
      );

      verify(
        () => mockAuthRepo.forgotPassword(tParams),
      ).called(1);
    });

    test("return ErrorResponse when ForgotPassword failed", () async {
      //Arrange
      when(
        () => mockAuthRepo.forgotPassword(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      //Act
      final result = await forgotPasswordUseCase.call(tParams);

      //Assert
      expect(result, isA<ErrorResponse<ForgotPasswordEntity>>());
      expect(
        (result as ErrorResponse<ForgotPasswordEntity>).errMessage,
        "error",
      );

      verify(
        () => mockAuthRepo.forgotPassword(tParams),
      ).called(1);
    });
  });
}
