import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_up_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_up_use_case.dart';

import 'sign_in_usecase_test.dart';

void main() {
  late MockAuthRepo mockAuthRepo;
  late SignUpUseCase signUpUsecase;

  setUp(() {
    mockAuthRepo = MockAuthRepo();
    signUpUsecase = SignUpUseCase(mockAuthRepo);
  });

  setUpAll(() {
    registerFallbackValue(
      const SignUpParams(
        username: '',
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        phoneNumber: '',
      ),
    );
  });

  group("SignUpUsecase", () {
    const tUser = UserEntity(
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
    test("return SuccessResponse when signUp success", () async {
      //arrange
      when(
        () => mockAuthRepo.signUp(
          const SignUpParams(
            username: "Yusuf",
            firstName: "Yusuf",
            lastName: "Mohamed",
            email: "youssefhamed374@gmail.com",
            password: "1234",
            phoneNumber: "1234",
          ),
        ),
      ).thenAnswer((_) async => const SuccessResponse(tUser));

      //act
      final result = await signUpUsecase.call(
        const SignUpParams(
          username: "Yusuf",
          firstName: "Yusuf",
          lastName: "Mohamed",
          email: "youssefhamed374@gmail.com",
          password: "1234",
          phoneNumber: "1234",
        ),
      );

      //assert
      expect(result, isA<SuccessResponse<UserEntity>>());
      expect((result as SuccessResponse<UserEntity>).data, tUser);
      verify(
        () => mockAuthRepo.signUp(
          const SignUpParams(
            username: "Yusuf",
            firstName: "Yusuf",
            lastName: "Mohamed",
            email: "youssefhamed374@gmail.com",
            password: "1234",
            phoneNumber: "1234",
          ),
        ),
      ).called(1);
    });

    test("return ErrorResponse when signUp failed", () async {
      //arrange
      when(
        () => mockAuthRepo.signUp(
          const SignUpParams(
            username: "Yusuf",
            firstName: "Yusuf",
            lastName: "Mohamed",
            email: "youssefhamed374@gmail.com",
            password: "1234",
            phoneNumber: "1234",
          ),
        ),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      //act
      final result = await signUpUsecase.call(
        const SignUpParams(
          username: "Yusuf",
          firstName: "Yusuf",
          lastName: "Mohamed",
          email: "youssefhamed374@gmail.com",
          password: "1234",
          phoneNumber: "1234",
        ),
      );

      //assert
      expect(result, isA<ErrorResponse<UserEntity>>());
      expect((result as ErrorResponse<UserEntity>).errMessage, "error");
      verify(
        () => mockAuthRepo.signUp(
          const SignUpParams(
            username: "Yusuf",
            firstName: "Yusuf",
            lastName: "Mohamed",
            email: "youssefhamed374@gmail.com",
            password: "1234",
            phoneNumber: "1234",
          ),
        ),
      ).called(1);
    });
  });
}
