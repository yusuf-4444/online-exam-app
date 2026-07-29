import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/data/datasource/local/auth_local_data_source.dart';
import 'package:online_exam_app/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_in_response_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_up_request_model.dart';
import 'package:online_exam_app/features/auth/data/models/sign_up_response_model.dart';
import 'package:online_exam_app/features/auth/data/repo/auth_repo_impl.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}

void main() {
  late MockAuthRemoteDataSource mockAuthRemoteDataSource;
  late MockAuthLocalDataSource mockAuthLocalDataSource;
  late AuthRepoImpl authRepoImpl;

  setUpAll(() {
    registerFallbackValue(SignInRequestModel(email: '', password: ''));
    registerFallbackValue(
      SignUpRequestModel(
        userName: "",
        firstName: "",
        lastName: "",
        email: "",
        password: "",
        phoneNumber: "",
      ),
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

  group("Login AuthRepo", () {
    final tUserModel = UserModel(
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

    final tSignInResponseModel = SignInResponseModel(
      message: 'success',
      token: 'fake_token_123',
      user: tUserModel,
    );

    final tSignInRequestModel = SignInRequestModel(
      email: "youssefhamed374@gmail.com",
      password: "1234",
    );

    test(
      "return SuccessResponse when Success Login and remember token",
      () async {
        //arrange
        when(
          () => mockAuthRemoteDataSource.login(any()),
        ).thenAnswer((_) async => SuccessResponse(tSignInResponseModel));

        when(
          () => mockAuthLocalDataSource.saveToken("fake_token_123"),
        ).thenAnswer((_) async {});

        //act
        final result = await authRepoImpl.login(
          tSignInRequestModel.email,
          tSignInRequestModel.password,
          true,
        );

        //assert
        expect(result, isA<SuccessResponse<dynamic>>());
        verify(() => mockAuthRemoteDataSource.login(any())).called(1);
        verify(
          () => mockAuthLocalDataSource.saveToken("fake_token_123"),
        ).called(1);
      },
    );

    test(
      "return SuccessResponse when Success Login and false remember token",
      () async {
        when(
          () => mockAuthRemoteDataSource.login(any()),
        ).thenAnswer((_) async => SuccessResponse(tSignInResponseModel));

        //act
        final result = await authRepoImpl.login(
          tSignInRequestModel.email,
          tSignInRequestModel.password,
          false,
        );

        //assert
        expect(result, isA<SuccessResponse<dynamic>>());
        verify(() => mockAuthRemoteDataSource.login(any())).called(1);
        verifyNever(() => mockAuthLocalDataSource.saveToken(any()));
      },
    );

    test("return ErrorResponse when Login failed", () async {
      //arrange
      when(
        () => mockAuthRemoteDataSource.login(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));

      //act
      final result = await authRepoImpl.login(
        "youssef@error.com",
        "1234",
        false,
      );

      //assert
      expect(result, isA<ErrorResponse<dynamic>>());
      expect((result as ErrorResponse).errMessage, "error");
      verifyNever(() => mockAuthLocalDataSource.saveToken(any()));
      verify(() => mockAuthRemoteDataSource.login(any())).called(1);
    });
  });

  group("SignUp AuthRepo", () {
    final tUserModel = UserModel(
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

    final tSignUpResponseModel = SignUpResponseModel(
      message: "success",
      token: "fake_user",
      user: tUserModel,
    );

    final tSignUpRequestModel = SignUpRequestModel(
      userName: "Yusuf",
      firstName: "Yusuf",
      lastName: "Mohamed",
      email: "yusuf@email.com",
      password: "1234",
      phoneNumber: "1234",
    );

    test(
      "return SuccessRespone when SignUp Success and remember token",
      () async {
        //arrange
        when(
          () => mockAuthRemoteDataSource.signUp((any())),
        ).thenAnswer((_) async => SuccessResponse(tSignUpResponseModel));

        when(
          () => mockAuthLocalDataSource.saveToken("fake_user"),
        ).thenAnswer((_) async => {});

        //act
        final result = await authRepoImpl.signUp(
          userName: tSignUpRequestModel.userName,
          firstName: tSignUpRequestModel.firstName,
          lastName: tSignUpRequestModel.lastName,
          email: tSignUpRequestModel.email,
          password: tSignUpRequestModel.password,
          phoneNumber: tSignUpRequestModel.phoneNumber,
        );

        //assert
        expect(result, isA<SuccessResponse<UserEntity>>());
        verify(() => mockAuthRemoteDataSource.signUp(any())).called(1);
        verify(() => mockAuthLocalDataSource.saveToken("fake_user")).called(1);
      },
    );

    test(
      "return Error Response when SignUp Failed and false remember token",
      () async {
        //arrange
        when(
          () => mockAuthRemoteDataSource.signUp(any()),
        ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));
        //act
        final result = await authRepoImpl.signUp(
          userName: tSignUpRequestModel.userName,
          firstName: tSignUpRequestModel.firstName,
          lastName: tSignUpRequestModel.lastName,
          email: tSignUpRequestModel.email,
          password: tSignUpRequestModel.password,
          phoneNumber: tSignUpRequestModel.phoneNumber,
        );

        //assert
        expect(result, isA<ErrorResponse<UserEntity>>());
        expect((result as ErrorResponse<UserEntity>).errMessage, "error");
        verifyNever(() => mockAuthLocalDataSource.saveToken(any()));
      },
    );
  });
}
