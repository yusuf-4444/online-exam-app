import 'package:equatable/equatable.dart';

class AnswerOptionEntity extends Equatable {
  final String key;
  final String text;

  const AnswerOptionEntity({required this.key, required this.text});

  @override
  List<Object?> get props => [key, text];
}
