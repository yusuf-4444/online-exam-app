import 'package:equatable/equatable.dart';

class VerifyOtpEntity extends Equatable {
  final String message;

  const VerifyOtpEntity({required this.message});

  @override
  List<Object?> get props => [message];
}