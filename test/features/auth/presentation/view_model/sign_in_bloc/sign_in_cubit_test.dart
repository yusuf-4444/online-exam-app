import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:online_exam_app/core/config/base_response/base_response.dart';
import 'package:online_exam_app/features/auth/domain/entities/sign_in_params.dart';
import 'package:online_exam_app/features/auth/domain/entities/user_entity.dart';
import 'package:online_exam_app/features/auth/domain/usecases/sign_in_use_case.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_bloc/sign_in_cubit.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_bloc/sign_in_intent.dart';
import 'package:online_exam_app/features/auth/presentation/view_model/sign_in_bloc/sign_in_state.dart';

class MockSignInUsecase extends Mock implements SignInUseCase {}

void main() {
  late MockSignInUsecase mockSignInUsecase;
  setUp(() {
    mockSignInUsecase = MockSignInUsecase();
  });

  setUpAll(() {
    registerFallbackValue(
      const SignInParams(email: '', password: '', rememberMe: false),
    );
  });

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

  setUpAll(() {
    registerFallbackValue(
      const SignInParams(email: '', password: '', rememberMe: false),
    );
    registerFallbackValue(
      SignInEvent(
        params: const SignInParams(email: '', password: '', rememberMe: false),
      ),
    );
  });

  blocTest<SignInCubit, SignInState>(
    'emits [Loading, Success] when MyEvent is Success.',
    build: () {
      when(
        () => mockSignInUsecase.call(any()),
      ).thenAnswer((_) async => const SuccessResponse(tUser));
      return SignInCubit(mockSignInUsecase);
    },
    act: (cubit) => cubit.doEvent(
      SignInEvent(
        params: const SignInParams(
          email: "yusuf@test.com",
          password: "1234",
          rememberMe: true,
        ),
      ),
    ),
    expect: () => [
      const SignInState.loading(),
      const SignInState.success(tUser),
    ],
    verify: (_) {
      verify(
        () => mockSignInUsecase.call(
          const SignInParams(
            email: "yusuf@test.com",
            password: "1234",
            rememberMe: true,
          ),
        ),
      ).called(1);
    },
  );

  blocTest<SignInCubit, SignInState>(
    'emits [Loading, Error] when MyEvent is Failed.',
    build: () {
      when(
        () => mockSignInUsecase.call(any()),
      ).thenAnswer((_) async => ErrorResponse(errMessage: "error"));
      return SignInCubit(mockSignInUsecase);
    },
    act: (cubit) => cubit.doEvent(
      SignInEvent(
        params: const SignInParams(
          email: "yusuf@test.com",
          password: "1234",
          rememberMe: true,
        ),
      ),
    ),
    expect: () => [
      const SignInState.loading(),
      const SignInState.error("error"),
    ],
    verify: (_) {
      verify(
        () => mockSignInUsecase.call(
          const SignInParams(
            email: "yusuf@test.com",
            password: "1234",
            rememberMe: true,
          ),
        ),
      ).called(1);
    },
  );
}
