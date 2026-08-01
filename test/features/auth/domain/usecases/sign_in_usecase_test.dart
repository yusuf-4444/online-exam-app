import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/repo/auth_repo.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_in_use_case.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

void main() {
  late MockAuthRepo mockAuthRepo;
  late SignInUsecase signInUsecase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    signInUsecase = SignInUsecase(mockAuthRepo);
  });

  group("SignInUsecase", () {
    final tUser = UserEntity(
      id: '1',
      username: 'yusuf',
      firstName: 'Yusuf',
      lastName: 'Mohamed',
      email: 'yusuf@test.com',
      phone: '01000000000',
      role: 'student',
      isVerified: true,
      createdAt: '2026-01-01',
    );

    test("return SuccessResponse when Login success", () async {
      //Arrange
      when(
        () => mockAuthRepo.login(
          SignInParams(
            email: "yusuf@test.com",
            password: "1234",
            rememberMe: true,
          ),
        ),
      ).thenAnswer((_) async => SuccessResponse(tUser));

      //Act
      final result = await signInUsecase.call("yusuf@test.com", "1234", true);

      //Assert
      expect(result, isA<SuccessResponse<UserEntity>>());
      expect((result as SuccessResponse<UserEntity>).data, tUser);
      verify(
        () => mockAuthRepo.login(
          SignInParams(
            email: "yusuf@test.com",
            password: "1234",
            rememberMe: true,
          ),
        ),
      ).called(1);
    });

    test("return ErrorResponse when Login failed", () async {
      //Arrange
      when(
        () => mockAuthRepo.login(
          SignInParams(
            email: "yusuf@error.com",
            password: "123",
            rememberMe: true,
          ),
        ),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      //Act
      final result = await signInUsecase.call("yusuf@error.com", "123", true);

      //Assert
      expect(result, isA<ErrorResponse<UserEntity>>());
      expect((result as ErrorResponse<UserEntity>).errMessage, "error");
      verify(
        () => mockAuthRepo.login(
          SignInParams(
            email: "yusuf@error.com",
            password: "123",
            rememberMe: true,
          ),
        ),
      ).called(1);
    });
  });
}
