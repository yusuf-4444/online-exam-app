import 'package:equatable/equatable.dart';

class VerifyOtpParams extends Equatable {
  final String resetCode;

  const VerifyOtpParams({required this.resetCode});

  @override
  List<Object?> get props => [resetCode];
}
