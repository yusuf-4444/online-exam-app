import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';
import 'package:online_exam_app/features/auth/domain/usecases/verify_otp_usecase.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late VerifyOtpUseCase verifyOtpUseCase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    verifyOtpUseCase = VerifyOtpUseCase(mockAuthRepo);
  });

  setUpAll(() {
    registerFallbackValue(const VerifyOtpParams(resetCode: ''));
  });

  group("VerifyOtpUseCase", () {
    const tEntity = VerifyOtpEntity(message: "Reset code verified");
    const tParams = VerifyOtpParams(resetCode: "1234");

    test("return SuccessResponse when verifyOtp success", () async {
      when(
        () => mockAuthRepo.verifyResetCode(any()),
      ).thenAnswer((_) async => const SuccessResponse(tEntity));

      final result = await verifyOtpUseCase.call(tParams);

      expect(result, isA<SuccessResponse<VerifyOtpEntity>>());
      expect((result as SuccessResponse<VerifyOtpEntity>).data, tEntity);

      verify(() => mockAuthRepo.verifyResetCode(tParams)).called(1);
    });

    test("return ErrorResponse when verifyOtp failed", () async {
      when(
        () => mockAuthRepo.verifyResetCode(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      final result = await verifyOtpUseCase.call(tParams);

      expect(result, isA<ErrorResponse<VerifyOtpEntity>>());
      expect((result as ErrorResponse<VerifyOtpEntity>).errMessage, "error");

      verify(() => mockAuthRepo.verifyResetCode(tParams)).called(1);
    });
  });
}
