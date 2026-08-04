import 'package:flutter_test/flutter_test.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/forgot_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/reset_password_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/verify_otp_response_model.dart';
import 'package:online_exam_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/forgot_password_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/reset_password_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_entity.dart';
import 'package:online_exam_app/features/auth/domain/entities/verify_otp_params.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepoImpl authRepoImpl;

  setUpAll(() {
    registerFallbackValue(ForgotPasswordRequestModel(email: ''));
    registerFallbackValue(VerifyOtpRequestModel(resetCode: ''));
    registerFallbackValue(
      ResetPasswordRequestModel(email: '', newPassword: ''),
    );
  });

  setUp(() {
    mockAuthRemoteDataSource = MockAuthRemoteDataSource();
    mockAuthLocalDataSource = MockAuthLocalDataSource();
    authRepoImpl = AuthRepoImpl(
      remoteDataSource: mockAuthRemoteDataSource,
      localDataSource: mockAuthLocalDataSource,
    );
  });
  group("ForgotPassword AuthRepo", () {
    final tResponseModel = ForgotPasswordResponseModel(
      message: "Reset code sent successfully",
    );

    test("return SuccessResponse when ForgotPassword success", () async {
      when(
        () => mockAuthRemoteDataSource.forgotPassword(any()),
      ).thenAnswer((_) async => SuccessResponse(tResponseModel));

      final result = await authRepoImpl.forgotPassword(
        const ForgotPasswordParams(email: "mohanad@test.com"),
      );

      expect(result, isA<SuccessResponse<ForgotPasswordEntity>>());

      expect(
        (result as SuccessResponse<ForgotPasswordEntity>).data.message,
        "Reset code sent successfully",
      );

      verify(() => mockAuthRemoteDataSource.forgotPassword(any())).called(1);
    });

    test("return ErrorResponse when ForgotPassword failed", () async {
      when(
        () => mockAuthRemoteDataSource.forgotPassword(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      final result = await authRepoImpl.forgotPassword(
        const ForgotPasswordParams(email: "mohanad@test.com"),
      );

      expect(result, isA<ErrorResponse<ForgotPasswordEntity>>());

      expect(
        (result as ErrorResponse<ForgotPasswordEntity>).errMessage,
        "error",
      );

      verify(() => mockAuthRemoteDataSource.forgotPassword(any())).called(1);
    });
  });

  group("VerifyOtp AuthRepo", () {
    final tResponseModel = VerifyOtpResponseModel(
      message: "Reset code verified successfully",
    );

    test("return SuccessResponse when VerifyOtp success", () async {
      when(
        () => mockAuthRemoteDataSource.verifyResetCode(any()),
      ).thenAnswer((_) async => SuccessResponse(tResponseModel));

      final result = await authRepoImpl.verifyResetCode(
        const VerifyOtpParams(resetCode: "123456"),
      );

      expect(result, isA<SuccessResponse<VerifyOtpEntity>>());

      expect(
        (result as SuccessResponse<VerifyOtpEntity>).data.message,
        "Reset code verified successfully",
      );

      verify(() => mockAuthRemoteDataSource.verifyResetCode(any())).called(1);
    });

    test("return ErrorResponse when VerifyOtp failed", () async {
      when(
        () => mockAuthRemoteDataSource.verifyResetCode(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      final result = await authRepoImpl.verifyResetCode(
        const VerifyOtpParams(resetCode: "123456"),
      );

      expect(result, isA<ErrorResponse<VerifyOtpEntity>>());

      expect((result as ErrorResponse<VerifyOtpEntity>).errMessage, "error");

      verify(() => mockAuthRemoteDataSource.verifyResetCode(any())).called(1);
    });
  });

  group("ResetPassword AuthRepo", () {
    final tResponseModel = ResetPasswordResponseModel(
      message: "Password reset successfully",
    );

    test("return SuccessResponse when ResetPassword success", () async {
      when(
        () => mockAuthRemoteDataSource.resetPassword(any()),
      ).thenAnswer((_) async => SuccessResponse(tResponseModel));

      final result = await authRepoImpl.resetPassword(
        const ResetPasswordParams(
          email: "mohanad@test.com",
          newPassword: "12345678",
        ),
      );

      expect(result, isA<SuccessResponse<ResetPasswordEntity>>());

      expect(
        (result as SuccessResponse<ResetPasswordEntity>).data.message,
        "Password reset successfully",
      );

      verify(() => mockAuthRemoteDataSource.resetPassword(any())).called(1);
    });

    test("return ErrorResponse when ResetPassword failed", () async {
      when(
        () => mockAuthRemoteDataSource.resetPassword(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      final result = await authRepoImpl.resetPassword(
        const ResetPasswordParams(
          email: "mohanad@test.com",
          newPassword: "12345678",
        ),
      );

      expect(result, isA<ErrorResponse<ResetPasswordEntity>>());

      expect(
        (result as ErrorResponse<ResetPasswordEntity>).errMessage,
        "error",
      );

      verify(() => mockAuthRemoteDataSource.resetPassword(any())).called(1);
    });
  });
}
